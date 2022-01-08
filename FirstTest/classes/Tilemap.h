#pragma once 

#include "Display.h"
#include "Blitter.h"

class Tile : public Blitable {

    Display *display;

    short tileWidth=32;
    short tileHeight=32;
    short tileWidthInBytes=tileWidth/8;
    short tileWidthInWords=tileWidth/16;
    short tileHeightInWords=tileHeight/16;

    int xPosGrid,yPosGrid;
    int xPosOffset,yPosOffset;
    int tile;
    UBYTE *tilePointer;

    public:
        Tile();
        ~Tile();
        void init(Display *screen,int xPosGrid,int yPosGrid,int tile);

        void blit() override;
};


class Tilemap {
    friend class Tile;
    short tileWidth=32;
    short tileHeight=32;
    short tileWidthInBytes=tileWidth/8;
    short tileWidthInWords=tileWidth/16;
    short tileHeightInWords=tileHeight/16;
    int width;
    int height;

    int visibleWidth;
    int visibleHeight;

    UBYTE *mapdata;

    Tile** tiles=NULL;

    public:
        Tilemap (int width, int height);
        ~Tilemap();
        void drawToScreen(Display* display);

};

