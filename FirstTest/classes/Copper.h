#pragma once

#include "../support/gcc8_c_support.h"
#include <hardware/custom.h>

#include <proto/graphics.h>
#include <hardware/custom.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <proto/exec.h>

#define COP_MOVE(addr,data) addr, data
#define COP_WAIT(pos) pos, 0xff00 
#define CP_WAIT_END 0xffff, 0xfffe
#define COLOR00 (0x180)
#define COLOR01 (0x182)
#define BPLCON0 (0x100)
#define BPLCON0_COMPOSITE_COLOR (1<<9)

class CopperList {
    friend class Copper;

    USHORT* copperList;
    USHORT* copPointer;

    CopperList();

    void setEndOfList();
    ULONG getCopperListPointer();

    public:

        static CopperList* create();

        CopperList* move(UWORD customRegister, UWORD value);

        CopperList* movePointer(UWORD customRegister, ULONG address);

        CopperList* wait(UWORD ypos, UWORD xpos);


        CopperList* wait(UWORD ypos);

        CopperList* backgroundColor(UWORD value);

};

class Copper {

    volatile struct Custom *custom;

    inline static Copper *singleton;

    Copper();

    ~Copper();

    public:

        static Copper* instance();

        static void destroy();

        void useCopperList(ULONG copperList);

        void useCopperList(CopperList* copperList);

 
};
