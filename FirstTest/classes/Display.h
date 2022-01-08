#pragma once

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
#include "Copper.h"
#include "ColorPalette.h"
#include "Bitplanes.h"

#define MONOCHROME 0x0001<<12
#define DEPTH_4_COLORS 0x0002<<12
#define DEPTH_8_COLORS 0x0003<<12
#define DEPTH_16_COLORS 0x0004<<12
#define DEPTH_32_COLORS 0x0005<<12


#define DIWSTRT_VALUE      0x2c81
#define DIWSTOP_VALUE_PAL  0x2cc1
#define DIWSTOP_VALUE_NTSC 0xf4c1

// Data fetch
#define DDFSTRT_VALUE      0x0038
#define DDFSTOP_VALUE      0x00d0

class Display {

//    UBYTE* bitplanes[5];
    Bitplanes* bitplanes;
    UWORD modeid;
    ColorPalette* colorPalette;

    private:
        volatile struct Custom *custom;

        View *originalActiView;
        CopperList *copperList;
    
        CopperList* buildCopperList();

        void init(UWORD modeid,bool interleaved);

    public:
        int width, height, widthInBytes,numberOfBitplanes;
        bool interleaved=false;

        Display(UWORD modeid);
        Display(UWORD modeid,bool interleaved);
        ~Display();
        void setBackgroundImage(UBYTE* image);
        void setColorPalette(ColorPalette* palette);
        void show ();
        bool isPAL();
        UBYTE* getBitplanes();
};
