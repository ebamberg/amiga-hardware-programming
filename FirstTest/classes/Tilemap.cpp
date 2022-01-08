#include "Tilemap.h"
#include "Display.h"

INCBIN_CHIP(tiles, "tiles.BPL") // load image into chipmem so we can use it without copying

Tilemap::Tilemap( int width, int height) {
    this->width=width;
    this->height=height;
    mapdata=(UBYTE *)AllocMem( width*height, MEMF_ANY);
    for (int i=0;i<width*height;i++) {
        *(mapdata+i)=0;
    }
}

Tilemap::~Tilemap() {
    if (tiles!=NULL) {
        for (int y=0;y<visibleHeight;y++) {
            for (int x=0;x<visibleWidth;x++) {
                delete tiles[visibleWidth*y+x];
            }
        }
        delete[] tiles;
    }
}


 void Tilemap::drawToScreen(Display* display) {
    visibleWidth=display->widthInBytes/tileWidthInBytes;
    visibleHeight=display->height/tileHeight;
    int numberOfTiles=visibleWidth*visibleHeight;
    if (tiles==NULL) {
        tiles=new Tile*[numberOfTiles];
        for (int y=0;y<visibleHeight;y++) {
            for (int x=0;x<visibleWidth;x++) {
                tiles[visibleWidth*y+x]=new Tile();
                tiles[visibleWidth*y+x]->init(display,x,y,0);
                BlitterControl::instance()->schedule(tiles[visibleWidth*y+x]);

            }
        }
    }


 }


Tile::Tile() {
}

Tile::~Tile() {
}


void Tile::init(Display *screen,int xPosGrid,int yPosGrid,int tile) {
            this->display=screen;
            
            this->yPosGrid=yPosGrid;
            this->xPosGrid=xPosGrid;
            this->xPosOffset=xPosGrid*tileWidthInBytes;

            this->yPosOffset=(yPosGrid*tileHeight)*display->widthInBytes*display->numberOfBitplanes ;

            this->tile=tile;
            this->tilePointer=(UBYTE *)tiles+tile*tileWidthInBytes*tileHeight*display->numberOfBitplanes;
}

void Tile::blit()  {
            KPrintF("Copy tile\n");
            custom->bltadat = 0xf0;
       // dma src B & C disabled so set all dat bits  for  channels per convention
            custom->bltbdat = 0xffff;
            custom->bltcdat = 0xffff;

            custom->bltcon0 = A_TO_D | SRCA | DEST; // 0x00f0;
            custom->bltcon1 = 0;
            custom->bltafwm = custom->bltalwm = 0xffff;
            custom->bltamod = (UWORD) 0;
            custom->bltdmod = (UWORD) display->widthInBytes - tileWidthInBytes;

            custom->bltapt = this->tilePointer;
            custom->bltdpt = ((UBYTE*) display->getBitplanes()) + xPosOffset + yPosOffset; //  320 / 8 * 200 * 5;

            custom->bltsize = (UWORD) ((tileHeight  * 5) << HSIZEBITS) | (tileWidthInWords);
}

