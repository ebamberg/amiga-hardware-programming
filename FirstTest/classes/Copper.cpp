#include "../support/gcc8_c_support.h"
#include <hardware/custom.h>

#include <proto/graphics.h>
#include <hardware/custom.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <proto/exec.h>

#include "Copper.h"

    CopperList::CopperList() {
        copperList= (USHORT*)AllocMem(1024, MEMF_CHIP);
        copPointer=copperList;  // sets pointer to start of list;
    }


     void CopperList::setEndOfList() {
        *copPointer=0xffff;
        *(copPointer+2)=0xfffe;
    }

    ULONG CopperList::getCopperListPointer() {
        return (ULONG) copperList;
    }

    CopperList* CopperList::create() {
        return new CopperList();
    }

    CopperList* CopperList::move(UWORD customRegister, UWORD value) {
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
        *copPointer++=value;
        setEndOfList();
        return this;
    }

    CopperList* CopperList::movePointer(UWORD customRegister, ULONG address) {
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
        *copPointer++=(UWORD)(address  ) & 0xffff;
        setEndOfList();
        return this;
    }

    CopperList* CopperList::wait(UWORD ypos, UWORD xpos) {
        *copPointer++= ( (ypos<<8) | ( (xpos & 0x7f<<1)) ) | 0x1; // ensure bit 0 is set, this indicates the word as a Copper Wait
        *copPointer++= 0xfffe;
        setEndOfList();
        return this;
    }

    CopperList* CopperList::wait(UWORD ypos) {
        *copPointer++= (ypos<<8 | 0x07) & 0xffff; // ensure bit 0 is set, this indicates the word as a Copper Wait
        *copPointer++= 0xff00;
        setEndOfList();
        return this;
    }

    CopperList* CopperList::backgroundColor(UWORD value) {
        *copPointer++=COLOR00 & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
        *copPointer++=value;
        setEndOfList();
        return this;
    }





    Copper::Copper() {
        custom = (struct Custom*)0xdff000;
    }

    Copper::~Copper() {
        WaitTOF();
        WaitTOF();
        custom->cop1lc = (ULONG) ((struct GfxBase *)GfxBase)->copinit;
        KPrintF("free resources for Copper Singleton");
    }

 
    Copper* Copper::instance(){
        if (Copper::singleton==NULL) {
            Copper::singleton=new Copper;
        }
        return Copper::singleton;
    }

    void Copper::destroy() {
        if (Copper::singleton!=NULL) {
            delete Copper::singleton;
        }
    }

    void Copper::useCopperList(ULONG copperList) {
        custom->cop1lc = copperList;
    }

    void Copper::useCopperList(CopperList* copperList) {
        custom->cop1lc = copperList->getCopperListPointer();
    }

 