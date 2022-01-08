
#include "Viewport.h"

Viewport::Viewport(int width,int height,int numberOfBitplanes) {
    this->width=width;
    this->widthInBytes=width/8;
    this->height=height;
    this->numberOfBitplanes=numberOfBitplanes;
}