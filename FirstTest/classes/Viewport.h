#pragma once

class Viewport {


    protected:
        int width;
        int height; 
        int numberOfBitplanes;
        int widthInBytes;

        Viewport(int width,int height,int numberOfBitplanes);

};