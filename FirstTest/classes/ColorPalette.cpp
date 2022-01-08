
#include "ColorPalette.h"

ColorPalette::ColorPalette(int colorCount, USHORT* palette) {
    colors=palette;
    numberOfColors=colorCount;
}

void ColorPalette::appendtoCopper(CopperList* copperList) {
    UWORD reg=0x180;
    for (int i=0; i<numberOfColors; i++) {
        copperList->move(reg,   ((USHORT*)colors)[i]) ;
        reg+=2;
    }
}