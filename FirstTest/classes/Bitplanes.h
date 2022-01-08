#pragma once

#include <proto/exec.h>
#include "Viewport.h"

class Bitplanes : public Viewport {

    UBYTE* bitplanes[5];
    bool interleaved=true;

    protected:
        void setBitplanePointers(UBYTE* mem);
    public:
        Bitplanes(int width, int height, int numberOfBitplanes);
        Bitplanes(UBYTE *,int width, int height, int numberOfBitplanes);

};
