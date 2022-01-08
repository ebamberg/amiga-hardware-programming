#include <proto/exec.h>
#include <graphics/gfxbase.h>
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <graphics/gfxmacros.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>
#include <hardware/intbits.h>
#include <proto/intuition.h>

#include <graphics/modeid.h>

#include "Display.h"


    Display::Display(UWORD mode) {
        init(mode,false);
    }

    Display::Display(UWORD mode,bool interleaved) {
        init(mode,interleaved);
    }

    void Display::init(UWORD mode,bool interleaved) {
            custom = (struct Custom*)0xdff000;
            bitplanes=NULL;

	        originalActiView=GfxBase->ActiView; //store current view
            LoadView(0);
	        WaitTOF();
	        WaitTOF();
            this->interleaved=interleaved;
            this->modeid=mode;
            if (modeid&HIRES) {
                width=640;
            } else {
                width=320;
            }
            if (isPAL()) {
                height=256;
            } else {
                height=200;
            }
            widthInBytes=width/8;
            numberOfBitplanes=mode>>12&0b111;

    }

    Display::~Display() {
            LoadView(originalActiView);
	        WaitTOF();
	        WaitTOF();
            RethinkDisplay();

    }   



    CopperList* Display::buildCopperList() {
          CopperList* cl= CopperList::create()
        //    ->move(offsetof (struct Custom,fmode), 0x0000)
            ->move(offsetof (struct Custom,ddfstrt),    DDFSTRT_VALUE  )
            ->move(offsetof (struct Custom,ddfstop),    DDFSTOP_VALUE  )
            ->move(offsetof (struct Custom,diwstrt),    DIWSTRT_VALUE  )
            ->move(offsetof (struct Custom,diwstop),isPAL() ? DIWSTOP_VALUE_PAL : DIWSTOP_VALUE_NTSC )
            ->move(offsetof (struct Custom, bplcon0) , modeid);
            if (this->interleaved) {
                cl->move(offsetof (struct Custom, bpl1mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     )
                  ->move(offsetof (struct Custom, bpl2mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     );
            } else {
                cl->move(offsetof (struct Custom, bpl1mod),   0x0     )
                  ->move(offsetof (struct Custom, bpl2mod),   0x0     );
            }
            //bitplan addresses
            
            UWORD bitplaneRegister=offsetof (struct Custom, bplpt[0]);
            for (int i=0;i<numberOfBitplanes;i++) {
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
                bitplaneRegister+=4;
            }
            if (colorPalette!=NULL) {
                colorPalette->appendtoCopper(cl);
            }
       //     cl  ->move(COLOR01, 0xfff)
       //         ->move(COLOR00, 0xf00);
       //     ->wait(  0x7c )
       //     ->move(COLOR00, 0x0f0)
       //     ->wait(  0xda, 0xa0 )
       //     ->backgroundColor(0x00f);
            return cl;
    }

    void Display::setBackgroundImage(UBYTE* image) {
        bitplanes=new Bitplanes(image,width,height,numberOfBitplanes);
    }

    void Display::setColorPalette(ColorPalette* palette) {
        colorPalette=palette;
    }

   void Display::show () {
       if (bitplanes==NULL) {
           bitplanes=new Bitplanes(width,height,numberOfBitplanes);
       }

        copperList=buildCopperList();
        Copper::instance()->useCopperList(
            copperList
        );
        custom->dmacon = DMAF_BLITTER;//disable blitter dma for copjmp bug
	    custom->copjmp1 = 0x7fff; //start coppper
	//    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;
	    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;

    }

    UBYTE* Display::getBitplanes() {
        return bitplanes->getBitplanePointer(0);
    }

    bool Display::isPAL() {
        return (((struct GfxBase *)  GfxBase)->DisplayFlags & PAL) ==PAL;
    }

