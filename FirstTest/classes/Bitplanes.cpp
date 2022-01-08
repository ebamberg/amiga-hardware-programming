#pragma once

#include <proto/exec.h>
#include "Bitplanes.h"

Bitplanes::Bitplanes(int width, int height, int numberOfBitplanes) : Viewport(width,height,numberOfBitplanes) {
           
    UBYTE* mem=(UBYTE *)AllocMem( (width/8)*height*numberOfBitplanes, MEMF_CHIP);
    setBitplanePointers(mem);
}

Bitplanes::Bitplanes(UBYTE *bitplanes, int width, int height, int numberOfBitplanes) : Viewport(width,height,numberOfBitplanes) {
    setBitplanePointers(bitplanes);
    
}

UBYTE* Bitplanes::getBitplanePointer(int index) {
    return bitplanes[index];
}

void Bitplanes::setBitplanePointers(UBYTE* mem) {
    int bitplanesize=widthInBytes*height;
        for (int i=0;i<numberOfBitplanes;i++) {
            if (!interleaved) {
                bitplanes[i]=(UBYTE*)(mem + bitplanesize * i);
            } else {
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
            }
        }

}