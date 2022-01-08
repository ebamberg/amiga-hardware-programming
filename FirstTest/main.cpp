#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <graphics/gfxbase.h>
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <graphics/gfxmacros.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>
#include <hardware/intbits.h>
#include <proto/intuition.h>

#include <graphics/modeid.h>

#include    "classes/Mouse.cpp"
#include    "classes/ColorPalette.h"
#include    "classes/Display.h"
#include    "classes/Blitter.h"
#include    "classes/Tilemap.h"

struct ExecBase *SysBase;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;
struct IntuitionBase *IntuitionBase;

// #include "amiga_stdlib.cpp"

static int TASK_PRIORITY=20;

using namespace std;

#ifndef __SIZE_T
#define __SIZE_T 1
typedef unsigned long size_t;
#endif


void * operator new(size_t size)
{
    KPrintF("Operator new Called");
    void *p = AllocMem( size, MEMF_ANY);
    return p;
}

void * operator new[](size_t size)
{
    KPrintF("Operator new[] Called");
    return ::operator new(size);
}

void operator delete(void * p)
{
    KPrintF("Operator delete Called");
    FreeMem( p, sizeof(p));
}

void operator delete(void * p, long unsigned int size)
{
    KPrintF("Operator delete Called");
    FreeMem( p, size);
}

void operator delete[](void * p)
{
    KPrintF("Operator delete Called");
    ::operator delete(p);
}

void operator delete[](void * p, long unsigned int size)
{
    KPrintF("Operator delete[] Called");
    ::operator delete(p, size);
}







class App {

    public:
        App() {
            KPrintF("Application created!\n");
            SetTaskPri(FindTask(NULL), TASK_PRIORITY); // setting task priority >20, greater then all OS function, allows us to us OS even when progamming the hardware
        }

        ~App() {
            KPrintF("Application destroyed!\n");
            Copper::destroy();
            BlitterControl::destroy();
        }

};

class TestBlitable : public Blitable {
    public:
        void blit() override {
            KPrintF("Blit Object\n");
        }
};



INCBIN_CHIP(image, "galaxy.BPL") // load image into chipmem so we can use it without copying
INCBIN(colors, "galaxy.PAL")
INCBIN_CHIP(bob, "bob.bpl")

INCBIN(tilescolors, "tiles.PAL")


class ClearDisplayJob : public Blitable {

    Display *display;

    public:
        ClearDisplayJob(Display* screen) {
            this->display=screen;
        }

        void blit() override {
            KPrintF("clear display\n");
            custom->bltcon0 = A_TO_D | DEST;
            custom->bltcon1 = 0;
            custom->bltadat = 0x0;
            custom->bltdpt = (APTR)image + 320 / 8 * 200 * 5;
            custom->bltdmod = 0;
            custom->bltafwm = custom->bltalwm = 0xffff;
            custom->bltsize = ((56 * 5) << HSIZEBITS) | (320/16);
        }
};



class CookieCutBlitTest : public Blitable {
    public:
        void blit() override {
            KPrintF("blit test bob\n");
 
            short i=0;
            const short x = 0;
			const short y = 0;
        	const APTR src = (APTR)bob + 32 / 8 * 10 * 16 * (i % 6);

			custom->bltapt = src;
			custom->bltamod = (UWORD) 32 / 8;
			custom->bltbpt = (APTR) src + 32 / 8 * 1;
			custom->bltbmod = (UWORD) 32 / 8;
			custom->bltcpt = custom->bltdpt =  (APTR)image + 320 / 8 * 5 * (256 + y) + x / 8;
			custom->bltcmod = custom->bltdmod = (UWORD) (320 - 32) / 8;
			custom->bltafwm = custom->bltalwm = 0xffff;
			custom->bltcon0 = 0xca | SRCA | SRCB | SRCC | DEST | ((x & 15) << ASHIFTSHIFT); // A = source, B = mask, C = background, D = destination
			custom->bltcon1 = ((x & 15) << BSHIFTSHIFT);

			custom->bltsize = ((16 * 5) << HSIZEBITS) | (32/16);
        }
};



int main() {
    SysBase = *((struct ExecBase**)4UL);
    
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
	if (!DOSBase)
		Exit(0);
	IntuitionBase = (struct IntuitionBase *)OpenLibrary((CONST_STRPTR)"intuition.library",0);
	if (!IntuitionBase)
		Exit(0);

	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
	if (!GfxBase)
		Exit(0);
    KPrintF("Started!\n");
    
    App app;

    Mouse mouse;
//    BlitterControl blitterControl;
    ColorPalette* palette=new ColorPalette(32, (USHORT *)colors);
    ColorPalette* tilespalette=new ColorPalette(32, (USHORT *)tilescolors);

    Display* startScreen=new Display(LORES_KEY|DEPTH_32_COLORS,true);

    startScreen->setBackgroundImage((UBYTE*) image);
    startScreen->setColorPalette(palette);

    Display* gameScreen=new Display(LORES_KEY|DEPTH_32_COLORS,true);
    gameScreen->setColorPalette(tilespalette);

    startScreen->show();

    mouse.waitLMB();

    gameScreen->show();

TestBlitable* a=new TestBlitable();
TestBlitable* b=new TestBlitable();
CookieCutBlitTest* c=new CookieCutBlitTest();
ClearDisplayJob* d=new ClearDisplayJob(gameScreen);

    Tilemap tilemap(100,100);

    BlitterControl::instance()->schedule(a);
    BlitterControl::instance()->schedule(b);
    BlitterControl::instance()->schedule(d);

    tilemap.drawToScreen(gameScreen);    

    // mainloop
    while(TRUE) {
        BlitterControl::instance()->check();
    }

    delete a;
    delete b;
    delete c;
    delete d;


 //   delete display;
    delete startScreen;
    delete gameScreen;
    delete palette;
    delete tilespalette;
    


	CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);

    return 0;
}