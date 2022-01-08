#pragma once

#include "../support/gcc8_c_support.h"
#include  "Copper.h"



class ColorPalette {

    USHORT* colors;

    int numberOfColors;

    public:
        ColorPalette(int numberOfColors, USHORT* palette);

        void appendtoCopper(CopperList *copperList);

};