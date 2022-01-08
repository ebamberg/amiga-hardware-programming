
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	       movem.l d2-d3/a2,-(sp)
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       4:	       move.l #8192,d3
       a:	       subi.l #8192,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	/----- beq.s 26 <_start+0x26>
      14:	|      lea 2000 <incbin_image_start>,a2
      1a:	|      moveq #0,d2
		__preinit_array_start[i]();
      1c:	|  /-> movea.l (a2)+,a0
      1e:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      20:	|  |   addq.l #1,d2
      22:	|  |   cmp.l d3,d2
      24:	|  \-- bne.s 1c <_start+0x1c>

	count = __init_array_end - __init_array_start;
      26:	\----> move.l #8192,d3
      2c:	       subi.l #8192,d3
      32:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      34:	/----- beq.s 48 <_start+0x48>
      36:	|      lea 2000 <incbin_image_start>,a2
      3c:	|      moveq #0,d2
		__init_array_start[i]();
      3e:	|  /-> movea.l (a2)+,a0
      40:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      42:	|  |   addq.l #1,d2
      44:	|  |   cmp.l d3,d2
      46:	|  \-- bne.s 3e <_start+0x3e>

	main();
      48:	\----> jsr 4e <main>

0000004e <main>:
        }
};



int main() {
      4e:	                                                                         lea -20(sp),sp
      52:	                                                                         movem.l d2-d7/a2-a6,-(sp)
    SysBase = *((struct ExecBase**)4UL);
      56:	                                                                         movea.l 4 <_start+0x4>,a6
      5a:	                                                                         move.l a6,fe90 <SysBase>
    
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      60:	                                                                         lea 130d <incbin_tilescolors_end+0x4b>,a1
      66:	                                                                         moveq #0,d0
      68:	                                                                         jsr -552(a6)
      6c:	                                                                         move.l d0,fe8c <DOSBase>
	if (!DOSBase)
      72:	      /----------------------------------------------------------------- beq.w 5b2 <main+0x564>
		Exit(0);
	IntuitionBase = (struct IntuitionBase *)OpenLibrary((CONST_STRPTR)"intuition.library",0);
      76:	      |                                                                  movea.l fe90 <SysBase>,a6
      7c:	      |                                                                  lea 1319 <incbin_tilescolors_end+0x57>,a1
      82:	      |                                                                  moveq #0,d0
      84:	      |                                                                  jsr -552(a6)
	if (!IntuitionBase)
      88:	      |                                                                  tst.l d0
      8a:	/-----|----------------------------------------------------------------- beq.w 588 <main+0x53a>
		Exit(0);

	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      8e:	|  /--|----------------------------------------------------------------> movea.l fe90 <SysBase>,a6
      94:	|  |  |                                                                  lea 132b <incbin_tilescolors_end+0x69>,a1
      9a:	|  |  |                                                                  moveq #0,d0
      9c:	|  |  |                                                                  jsr -552(a6)
      a0:	|  |  |                                                                  move.l d0,fe88 <GfxBase>
	if (!GfxBase)
      a6:	|  |  |        /-------------------------------------------------------- beq.w 5d4 <main+0x586>
		Exit(0);
    KPrintF("Started!\n");
      aa:	|  |  |        |  /----------------------------------------------------> pea 133c <incbin_tilescolors_end+0x7a>
      b0:	|  |  |        |  |                                                      lea 878 <KPrintF>,a4
      b6:	|  |  |        |  |                                                      jsr (a4)
            KPrintF("Application created!\n");
      b8:	|  |  |        |  |                                                      pea 1346 <incbin_tilescolors_end+0x84>
      be:	|  |  |        |  |                                                      jsr (a4)
            SetTaskPri(FindTask(NULL), TASK_PRIORITY); // setting task priority >20, greater then all OS function, allows us to us OS even when progamming the hardware
      c0:	|  |  |        |  |                                                      movea.l fe90 <SysBase>,a6
      c6:	|  |  |        |  |                                                      suba.l a1,a1
      c8:	|  |  |        |  |                                                      jsr -294(a6)
      cc:	|  |  |        |  |                                                      movea.l fe90 <SysBase>,a6
      d2:	|  |  |        |  |                                                      movea.l d0,a1
      d4:	|  |  |        |  |                                                      moveq #20,d0
      d6:	|  |  |        |  |                                                      jsr -300(a6)
    KPrintF("Operator new Called");
      da:	|  |  |        |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
      e0:	|  |  |        |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
      e2:	|  |  |        |  |                                                      movea.l fe90 <SysBase>,a6
      e8:	|  |  |        |  |                                                      moveq #8,d0
      ea:	|  |  |        |  |                                                      moveq #0,d1
      ec:	|  |  |        |  |                                                      jsr -198(a6)
      f0:	|  |  |        |  |                                                      movea.l d0,a5

#include "ColorPalette.h"

ColorPalette::ColorPalette(int colorCount, USHORT* palette) {
    colors=palette;
      f2:	|  |  |        |  |                                                      move.l #4672,(a5)
    numberOfColors=colorCount;
      f8:	|  |  |        |  |                                                      moveq #32,d0
      fa:	|  |  |        |  |                                                      move.l d0,4(a5)
    KPrintF("Operator new Called");
      fe:	|  |  |        |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     104:	|  |  |        |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     106:	|  |  |        |  |                                                      movea.l fe90 <SysBase>,a6
     10c:	|  |  |        |  |                                                      moveq #8,d0
     10e:	|  |  |        |  |                                                      moveq #0,d1
     110:	|  |  |        |  |                                                      jsr -198(a6)
     114:	|  |  |        |  |                                                      movea.l d0,a3
    colors=palette;
     116:	|  |  |        |  |                                                      move.l #4738,(a3)
    numberOfColors=colorCount;
     11c:	|  |  |        |  |                                                      moveq #32,d1
     11e:	|  |  |        |  |                                                      move.l d1,4(a3)
    KPrintF("Operator new Called");
     122:	|  |  |        |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     128:	|  |  |        |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     12a:	|  |  |        |  |                                                      movea.l fe90 <SysBase>,a6
     130:	|  |  |        |  |                                                      moveq #40,d0
     132:	|  |  |        |  |                                                      moveq #0,d1
     134:	|  |  |        |  |                                                      jsr -198(a6)
     138:	|  |  |        |  |                                                      movea.l d0,a2

    Display::Display(UWORD mode) {
        init(mode,false);
    }

    Display::Display(UWORD mode,bool interleaved) {
     13a:	|  |  |        |  |                                                      clr.b 38(a2)
        init(mode,interleaved);
     13e:	|  |  |        |  |                                                      pea 1 <_start+0x1>
     142:	|  |  |        |  |                                                      pea 5000 <incbin_image_start+0x3000>
     146:	|  |  |        |  |                                                      move.l d0,-(sp)
     148:	|  |  |        |  |                                                      move.l #2024,d2
     14e:	|  |  |        |  |                                                      movea.l d2,a0
     150:	|  |  |        |  |                                                      jsr (a0)
       //     ->backgroundColor(0x00f);
            return cl;
    }

    void Display::setBackgroundImage(UBYTE* image) {
        bitplanes=new Bitplanes(image,width,height,numberOfBitplanes);
     152:	|  |  |        |  |                                                      lea 32(sp),sp
     156:	|  |  |        |  |                                                      pea 26 <_start+0x26>
     15a:	|  |  |        |  |                                                      jsr 8ea <_Znwm>
     160:	|  |  |        |  |                                                      movea.l d0,a0
     162:	|  |  |        |  |                                                      move.l 34(a2),d0
     166:	|  |  |        |  |                                                      movea.l 26(a2),a1
     16a:	|  |  |        |  |                                                      move.l 22(a2),d1

#include "Viewport.h"

Viewport::Viewport(int width,int height,int numberOfBitplanes) {
    this->width=width;
     16e:	|  |  |        |  |                                                      move.l d1,(a0)
    this->widthInBytes=width/8;
     170:	|  |  |        |  |                                                      addq.l #4,sp
     172:	|  |  |  /-----|--|----------------------------------------------------- bmi.w 56a <main+0x51c>
     176:	|  |  |  |  /--|--|----------------------------------------------------> asr.l #3,d1
     178:	|  |  |  |  |  |  |                                                      move.l d1,12(a0)
    this->height=height;
     17c:	|  |  |  |  |  |  |                                                      move.l a1,4(a0)
    this->numberOfBitplanes=numberOfBitplanes;
     180:	|  |  |  |  |  |  |                                                      move.l d0,8(a0)
           
    UBYTE* mem=(UBYTE *)AllocMem( (width/8)*height*numberOfBitplanes, MEMF_CHIP);
    setBitplanePointers(mem);
}

Bitplanes::Bitplanes(UBYTE *bitplanes, int width, int height, int numberOfBitplanes) : Viewport(width,height,numberOfBitplanes) {
     184:	|  |  |  |  |  |  |                                                      move.b #1,36(a0)
    return bitplanes[index];
}

void Bitplanes::setBitplanePointers(UBYTE* mem) {
    int bitplanesize=widthInBytes*height;
        for (int i=0;i<numberOfBitplanes;i++) {
     18a:	|  |  |  |  |  |  |                                                      tst.l d0
     18c:	|  |  |  |  |  |  |                                                  /-- ble.s 1e0 <main+0x192>
            if (!interleaved) {
                bitplanes[i]=(UBYTE*)(mem + bitplanesize * i);
            } else {
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
     18e:	|  |  |  |  |  |  |                                                  |   move.l #8192,16(a0)
        for (int i=0;i<numberOfBitplanes;i++) {
     196:	|  |  |  |  |  |  |                                                  |   moveq #1,d3
     198:	|  |  |  |  |  |  |                                                  |   cmp.l d0,d3
     19a:	|  |  |  |  |  |  |                                                  +-- beq.s 1e0 <main+0x192>
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
     19c:	|  |  |  |  |  |  |                                                  |   move.l d1,d4
     19e:	|  |  |  |  |  |  |                                                  |   addi.l #8192,d4
     1a4:	|  |  |  |  |  |  |                                                  |   move.l d4,20(a0)
        for (int i=0;i<numberOfBitplanes;i++) {
     1a8:	|  |  |  |  |  |  |                                                  |   moveq #2,d3
     1aa:	|  |  |  |  |  |  |                                                  |   cmp.l d0,d3
     1ac:	|  |  |  |  |  |  |                                                  +-- beq.s 1e0 <main+0x192>
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
     1ae:	|  |  |  |  |  |  |                                                  |   move.l d1,d3
     1b0:	|  |  |  |  |  |  |                                                  |   add.l d1,d3
     1b2:	|  |  |  |  |  |  |                                                  |   move.l d3,d4
     1b4:	|  |  |  |  |  |  |                                                  |   addi.l #8192,d4
     1ba:	|  |  |  |  |  |  |                                                  |   move.l d4,24(a0)
        for (int i=0;i<numberOfBitplanes;i++) {
     1be:	|  |  |  |  |  |  |                                                  |   moveq #3,d4
     1c0:	|  |  |  |  |  |  |                                                  |   cmp.l d0,d4
     1c2:	|  |  |  |  |  |  |                                                  +-- beq.s 1e0 <main+0x192>
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
     1c4:	|  |  |  |  |  |  |                                                  |   add.l d3,d1
     1c6:	|  |  |  |  |  |  |                                                  |   addi.l #8192,d1
     1cc:	|  |  |  |  |  |  |                                                  |   move.l d1,28(a0)
        for (int i=0;i<numberOfBitplanes;i++) {
     1d0:	|  |  |  |  |  |  |                                                  |   subq.l #4,d0
     1d2:	|  |  |  |  |  |  |                                                  +-- beq.s 1e0 <main+0x192>
                bitplanes[i]=(UBYTE*)(mem + (widthInBytes * i));
     1d4:	|  |  |  |  |  |  |                                                  |   add.l d3,d3
     1d6:	|  |  |  |  |  |  |                                                  |   addi.l #8192,d3
     1dc:	|  |  |  |  |  |  |                                                  |   move.l d3,32(a0)
     1e0:	|  |  |  |  |  |  |                                                  \-> move.l a0,(a2)
    }

    void Display::setColorPalette(ColorPalette* palette) {
        colorPalette=palette;
     1e2:	|  |  |  |  |  |  |                                                      move.l a5,6(a2)
    KPrintF("Operator new Called");
     1e6:	|  |  |  |  |  |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     1ec:	|  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     1ee:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     1f4:	|  |  |  |  |  |  |                                                      moveq #40,d0
     1f6:	|  |  |  |  |  |  |                                                      moveq #0,d1
     1f8:	|  |  |  |  |  |  |                                                      jsr -198(a6)
     1fc:	|  |  |  |  |  |  |                                                      movea.l d0,a5
    Display::Display(UWORD mode,bool interleaved) {
     1fe:	|  |  |  |  |  |  |                                                      clr.b 38(a5)
        init(mode,interleaved);
     202:	|  |  |  |  |  |  |                                                      pea 1 <_start+0x1>
     206:	|  |  |  |  |  |  |                                                      pea 5000 <incbin_image_start+0x3000>
     20a:	|  |  |  |  |  |  |                                                      move.l d0,-(sp)
     20c:	|  |  |  |  |  |  |                                                      movea.l d2,a0
     20e:	|  |  |  |  |  |  |                                                      jsr (a0)
        colorPalette=palette;
     210:	|  |  |  |  |  |  |                                                      move.l a3,6(a5)
    startScreen->setColorPalette(palette);

    Display* gameScreen=new Display(LORES_KEY|DEPTH_32_COLORS,true);
    gameScreen->setColorPalette(tilespalette);

    startScreen->show();
     214:	|  |  |  |  |  |  |                                                      move.l a2,-(sp)
     216:	|  |  |  |  |  |  |                                                      lea 90c <_ZN7Display4showEv>,a2
     21c:	|  |  |  |  |  |  |                                                      jsr (a2)
     21e:	|  |  |  |  |  |  |                                                      lea 20(sp),sp
    volatile UBYTE *ciaa_pra = (volatile UBYTE *) 0xbfe001;
    #define PRA_FIR0_BIT (1 << 6) 

    public:
        void waitLMB() {
            while ((*ciaa_pra & PRA_FIR0_BIT)!=0);
     222:	|  |  |  |  |  |  |                                                  /-> move.b bfe001 <gcc8_c_support.c.915a8519+0xbeae5e>,d0
     228:	|  |  |  |  |  |  |                                                  |   btst #6,d0
     22c:	|  |  |  |  |  |  |                                                  \-- bne.s 222 <main+0x1d4>

    mouse.waitLMB();

    gameScreen->show();
     22e:	|  |  |  |  |  |  |                                                      move.l a5,-(sp)
     230:	|  |  |  |  |  |  |                                                      jsr (a2)
    KPrintF("Operator new Called");
     232:	|  |  |  |  |  |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     238:	|  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     23a:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     240:	|  |  |  |  |  |  |                                                      moveq #16,d0
     242:	|  |  |  |  |  |  |                                                      moveq #0,d1
     244:	|  |  |  |  |  |  |                                                      jsr -198(a6)
     248:	|  |  |  |  |  |  |                                                      move.l d0,d2
#include "../support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/graphics.h>
#include "Blitter.h"

Blitable::Blitable() {
     24a:	|  |  |  |  |  |  |                                                      movea.l d0,a0
     24c:	|  |  |  |  |  |  |                                                      clr.l 4(a0)
     250:	|  |  |  |  |  |  |                                                      clr.l 8(a0)
    custom = (struct Custom*)0xdff000;
     254:	|  |  |  |  |  |  |                                                      move.l #14675968,12(a0)
class TestBlitable : public Blitable {
     25c:	|  |  |  |  |  |  |                                                      move.l #5036,(a0)
    KPrintF("Operator new Called");
     262:	|  |  |  |  |  |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     268:	|  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     26a:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     270:	|  |  |  |  |  |  |                                                      moveq #16,d0
     272:	|  |  |  |  |  |  |                                                      moveq #0,d1
     274:	|  |  |  |  |  |  |                                                      jsr -198(a6)
     278:	|  |  |  |  |  |  |                                                      movea.l d0,a3
Blitable::Blitable() {
     27a:	|  |  |  |  |  |  |                                                      clr.l 4(a3)
     27e:	|  |  |  |  |  |  |                                                      clr.l 8(a3)
    custom = (struct Custom*)0xdff000;
     282:	|  |  |  |  |  |  |                                                      move.l #14675968,12(a3)
class TestBlitable : public Blitable {
     28a:	|  |  |  |  |  |  |                                                      move.l #5036,(a3)
    KPrintF("Operator new Called");
     290:	|  |  |  |  |  |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     296:	|  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     298:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     29e:	|  |  |  |  |  |  |                                                      moveq #16,d0
     2a0:	|  |  |  |  |  |  |                                                      moveq #0,d1
     2a2:	|  |  |  |  |  |  |                                                      jsr -198(a6)
     2a6:	|  |  |  |  |  |  |                                                      movea.l d0,a0
Blitable::Blitable() {
     2a8:	|  |  |  |  |  |  |                                                      clr.l 4(a0)
     2ac:	|  |  |  |  |  |  |                                                      clr.l 8(a0)
    custom = (struct Custom*)0xdff000;
     2b0:	|  |  |  |  |  |  |                                                      move.l #14675968,12(a0)
class CookieCutBlitTest : public Blitable {
     2b8:	|  |  |  |  |  |  |                                                      move.l #5024,(a0)
    KPrintF("Operator new Called");
     2be:	|  |  |  |  |  |  |                                                      pea 12c3 <incbin_tilescolors_end+0x1>
     2c4:	|  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     2c6:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     2cc:	|  |  |  |  |  |  |                                                      moveq #20,d0
     2ce:	|  |  |  |  |  |  |                                                      moveq #0,d1
     2d0:	|  |  |  |  |  |  |                                                      jsr -198(a6)
     2d4:	|  |  |  |  |  |  |                                                      movea.l d0,a2
Blitable::Blitable() {
     2d6:	|  |  |  |  |  |  |                                                      clr.l 4(a2)
     2da:	|  |  |  |  |  |  |                                                      clr.l 8(a2)
    custom = (struct Custom*)0xdff000;
     2de:	|  |  |  |  |  |  |                                                      move.l #14675968,12(a2)
        ClearDisplayJob(Display* screen) {
     2e6:	|  |  |  |  |  |  |                                                      move.l #5012,(a2)
            this->display=screen;
     2ec:	|  |  |  |  |  |  |                                                      move.l a5,16(a2)
INCBIN_CHIP(tiles, "tiles.BPL") // load image into chipmem so we can use it without copying

Tilemap::Tilemap( int width, int height) {
    this->width=width;
    this->height=height;
    mapdata=(UBYTE *)AllocMem( width*height, MEMF_ANY);
     2f0:	|  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     2f6:	|  |  |  |  |  |  |                                                      move.l #10000,d0
     2fc:	|  |  |  |  |  |  |                                                      moveq #0,d1
     2fe:	|  |  |  |  |  |  |                                                      jsr -198(a6)
    for (int i=0;i<width*height;i++) {
        *(mapdata+i)=0;
     302:	|  |  |  |  |  |  |                                                      pea 2710 <incbin_image_start+0x710>
     306:	|  |  |  |  |  |  |                                                      clr.l -(sp)
     308:	|  |  |  |  |  |  |                                                      move.l d0,-(sp)
     30a:	|  |  |  |  |  |  |                                                      jsr e4e <memset>
CookieCutBlitTest* c=new CookieCutBlitTest();
ClearDisplayJob* d=new ClearDisplayJob(gameScreen);

    Tilemap tilemap(100,100);

    BlitterControl::instance()->schedule(a);
     310:	|  |  |  |  |  |  |                                                      lea 32(sp),sp
     314:	|  |  |  |  |  |  |                                                      move.l #3416,d3
     31a:	|  |  |  |  |  |  |                                                      movea.l d3,a0
     31c:	|  |  |  |  |  |  |                                                      jsr (a0)
     31e:	|  |  |  |  |  |  |                                                      move.l d2,-(sp)
     320:	|  |  |  |  |  |  |                                                      move.l d0,-(sp)
     322:	|  |  |  |  |  |  |                                                      lea 774 <_ZN14BlitterControl8scheduleEP8Blitable>,a6
     328:	|  |  |  |  |  |  |                                                      jsr (a6)
    BlitterControl::instance()->schedule(b);
     32a:	|  |  |  |  |  |  |                                                      movea.l d3,a0
     32c:	|  |  |  |  |  |  |                                                      jsr (a0)
     32e:	|  |  |  |  |  |  |                                                      move.l a3,-(sp)
     330:	|  |  |  |  |  |  |                                                      move.l d0,-(sp)
     332:	|  |  |  |  |  |  |                                                      jsr (a6)
    BlitterControl::instance()->schedule(d);
     334:	|  |  |  |  |  |  |                                                      movea.l d3,a0
     336:	|  |  |  |  |  |  |                                                      jsr (a0)
     338:	|  |  |  |  |  |  |                                                      move.l a2,-(sp)
     33a:	|  |  |  |  |  |  |                                                      move.l d0,-(sp)
     33c:	|  |  |  |  |  |  |                                                      jsr (a6)
    }
}


 void Tilemap::drawToScreen(Display* display) {
    visibleWidth=display->widthInBytes/tileWidthInBytes;
     33e:	|  |  |  |  |  |  |                                                      move.l 30(a5),d3
     342:	|  |  |  |  |  |  |                                                      move.l d3,d6
     344:	|  |  |  |  |  |  |                                                      lea 24(sp),sp
     348:	|  |  |  |  |  |  |                             /----------------------- bmi.w 578 <main+0x52a>
     34c:	|  |  |  |  |  |  |                             |                        asr.l #2,d6
    visibleHeight=display->height/tileHeight;
     34e:	|  |  |  |  |  |  |                             |                        move.l 26(a5),d2
     352:	|  |  |  |  |  |  |                             |                        move.l d2,d0
     354:	|  |  |  |  |  |  |                          /--|----------------------- bmi.w 570 <main+0x522>
     358:	|  |  |  |  |  |  |                          |  |  /-------------------> asr.l #5,d0
     35a:	|  |  |  |  |  |  |                          |  |  |                     move.l d0,52(sp)
    int numberOfTiles=visibleWidth*visibleHeight;
     35e:	|  |  |  |  |  |  |                          |  |  |                     move.l #4192,d4
     364:	|  |  |  |  |  |  |                          |  |  |                     move.l d0,-(sp)
     366:	|  |  |  |  |  |  |                          |  |  |                     move.l d6,-(sp)
     368:	|  |  |  |  |  |  |                          |  |  |                     movea.l d4,a0
     36a:	|  |  |  |  |  |  |                          |  |  |                     jsr (a0)
     36c:	|  |  |  |  |  |  |                          |  |  |                     addq.l #8,sp
    if (tiles==NULL) {
        tiles=new Tile*[numberOfTiles];
     36e:	|  |  |  |  |  |  |                          |  |  |                     cmpi.l #536870911,d0
     374:	|  |  |  |  |  |  |                          |  |  |  /----------------- bhi.w 514 <main+0x4c6>
     378:	|  |  |  |  |  |  |                          |  |  |  |                  add.l d0,d0
     37a:	|  |  |  |  |  |  |                          |  |  |  |                  move.l d0,d5
     37c:	|  |  |  |  |  |  |                          |  |  |  |                  add.l d0,d5
    KPrintF("Operator new[] Called");
     37e:	|  |  |  |  |  |  |                          |  |  |  |  /-------------> pea 135c <incbin_tilescolors_end+0x9a>
     384:	|  |  |  |  |  |  |                          |  |  |  |  |               jsr (a4)
    KPrintF("Operator new Called");
     386:	|  |  |  |  |  |  |                          |  |  |  |  |               pea 12c3 <incbin_tilescolors_end+0x1>
     38c:	|  |  |  |  |  |  |                          |  |  |  |  |               jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     38e:	|  |  |  |  |  |  |                          |  |  |  |  |               movea.l fe90 <SysBase>,a6
     394:	|  |  |  |  |  |  |                          |  |  |  |  |               move.l d5,d0
     396:	|  |  |  |  |  |  |                          |  |  |  |  |               moveq #0,d1
     398:	|  |  |  |  |  |  |                          |  |  |  |  |               jsr -198(a6)
     39c:	|  |  |  |  |  |  |                          |  |  |  |  |               move.l d0,64(sp)
        for (int y=0;y<visibleHeight;y++) {
     3a0:	|  |  |  |  |  |  |                          |  |  |  |  |               addq.l #8,sp
     3a2:	|  |  |  |  |  |  |                          |  |  |  |  |               moveq #31,d0
     3a4:	|  |  |  |  |  |  |                          |  |  |  |  |               cmp.l d2,d0
     3a6:	|  |  |  |  |  |  |  /-----------------------|--|--|--|--|-------------- bge.w 758 <main+0x70a>
     3aa:	|  |  |  |  |  |  |  |                       |  |  |  |  |               moveq #3,d1
     3ac:	|  |  |  |  |  |  |  |                       |  |  |  |  |               cmp.l d3,d1
     3ae:	|  |  |  |  |  |  |  +-----------------------|--|--|--|--|-------------- bge.w 758 <main+0x70a>
     3b2:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l d6,d0
     3b4:	|  |  |  |  |  |  |  |                       |  |  |  |  |               neg.l d0
     3b6:	|  |  |  |  |  |  |  |                       |  |  |  |  |               add.l d0,d0
     3b8:	|  |  |  |  |  |  |  |                       |  |  |  |  |               add.l d0,d0
     3ba:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l d0,60(sp)
     3be:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l 56(sp),d0
     3c2:	|  |  |  |  |  |  |  |                       |  |  |  |  |               neg.l d0
     3c4:	|  |  |  |  |  |  |  |                       |  |  |  |  |               clr.l 48(sp)
     3c8:	|  |  |  |  |  |  |  |                       |  |  |  |  |               moveq #0,d3
     3ca:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l #65160,d5
     3d0:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l d5,44(sp)
     3d4:	|  |  |  |  |  |  |  |                       |  |  |  |  |               move.l d0,d5
            for (int x=0;x<visibleWidth;x++) {
     3d6:	|  |  |  |  |  |  |  |                       |  |  |  |  |  /----------> movea.l 48(sp),a3
     3da:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            adda.l a3,a3
     3dc:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            adda.l a3,a3
     3de:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            adda.l 56(sp),a3
     3e2:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            moveq #0,d2
     3e4:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            move.l d5,d7
     3e6:	|  |  |  |  |  |  |  |                       |  |  |  |  |  |            subq.l #4,d7
    KPrintF("Operator new Called");
     3e8:	|  |  |  |  |  |  |  |  /--------------------|--|--|--|--|--|----------> pea 12c3 <incbin_tilescolors_end+0x1>
     3ee:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     3f0:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            movea.l fe90 <SysBase>,a6
     3f6:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            moveq #54,d0
     3f8:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            moveq #0,d1
     3fa:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            jsr -198(a6)
     3fe:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            movea.l d0,a6
Blitable::Blitable() {
     400:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            clr.l 4(a6)
     404:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            clr.l 8(a6)
    custom = (struct Custom*)0xdff000;
     408:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l #14675968,12(a6)


 }


Tile::Tile() {
     410:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l #5000,(a6)
     416:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.w #32,20(a6)
     41c:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.w #32,22(a6)
     422:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.w #4,24(a6)
     428:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.w #2,26(a6)
     42e:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.w #2,28(a6)
                tiles[visibleWidth*y+x]=new Tile();
     434:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d0,(a3)+
Tile::~Tile() {
}


void Tile::init(Display *screen,int xPosGrid,int yPosGrid,int tile) {
            this->display=screen;
     436:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l a5,16(a6)
            
            this->yPosGrid=yPosGrid;
     43a:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d3,34(a6)
            this->xPosGrid=xPosGrid;
     43e:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d2,30(a6)
            this->xPosOffset=xPosGrid*tileWidthInBytes;
     442:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            lea (0,a3,d7.l),a0
     446:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l a0,38(a6)

            this->yPosOffset=(yPosGrid*tileHeight)*display->widthInBytes*display->numberOfBitplanes ;
     44a:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l 30(a5),-(sp)
     44e:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d3,-(sp)
     450:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            movea.l d4,a0
     452:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            jsr (a0)
     454:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            addq.l #4,sp
     456:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l 34(a5),(sp)
     45a:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d0,-(sp)
     45c:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            movea.l d4,a0
     45e:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            jsr (a0)
     460:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            lsl.l #5,d0
     462:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l d0,42(a6)

            this->tile=tile;
     466:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            clr.l 46(a6)
            this->tilePointer=(UBYTE *)tiles+tile*tileWidthInBytes*tileHeight*display->numberOfBitplanes;
     46a:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            move.l #63236,50(a6)
}

BlitterControl* BlitterControl::instance(){
    if (BlitterControl::singleton==NULL) {
     472:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     478:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            lea 12(sp),sp
     47c:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |            cmpa.w #0,a2
     480:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |     /----- beq.w 51a <main+0x4cc>
    custom = (struct Custom*)0xdff000;
    DisownBlitter();
}

bool BlitterControl::isScheduled(Blitable *blit) {
    if (blit->prev!=NULL || currentBlit==blit) {
     484:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |  /--|----> cmpa.l (a2),a6
     486:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |  |  |  /-- beq.s 4a0 <main+0x452>
        KPrintF("blitter busy\n");
    }
}

bool BlitterControl::hasMoreScheduled() {
    if (lastScheduledBlitable==NULL) {
     488:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |  |  |  |   movea.l 4(a2),a0
     48c:	|  |  |  |  |  |  |  |  |                    |  |  |  |  |  |  |  |  |   cmpa.w #0,a0
     490:	|  |  |  |  |  |  |  |  |     /--------------|--|--|--|--|--|--|--|--|-- beq.w 73c <main+0x6ee>
            blit->prev=lastScheduledBlitable;
     494:	|  |  |  |  |  |  |  |  |     |              |  |  |  |  |  |  |  |  |   move.l a0,8(a6)
            lastScheduledBlitable->next=blit;
     498:	|  |  |  |  |  |  |  |  |     |              |  |  |  |  |  |  |  |  |   move.l a6,4(a0)
            lastScheduledBlitable=blit;
     49c:	|  |  |  |  |  |  |  |  |     |              |  |  |  |  |  |  |  |  |   move.l a6,4(a2)
            for (int x=0;x<visibleWidth;x++) {
     4a0:	|  |  |  |  |  |  |  |  |     |              |  |  |  |  |  |  |  |  \-> addq.l #1,d2
     4a2:	|  |  |  |  |  |  |  |  |     |              |  |  |  |  |  |  |  |      cmp.l d6,d2
     4a4:	|  |  |  |  |  |  |  |  +-----|--------------|--|--|--|--|--|--|--|----- blt.w 3e8 <main+0x39a>
        for (int y=0;y<visibleHeight;y++) {
     4a8:	|  |  |  |  |  |  |  |  |  /--|--------------|--|--|--|--|--|--|--|----> addq.l #1,d3
     4aa:	|  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |      add.l d6,48(sp)
     4ae:	|  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |      add.l 60(sp),d5
     4b2:	|  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |      cmp.l 52(sp),d3
     4b6:	|  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  \--|--|----- blt.w 3d6 <main+0x388>
     4ba:	|  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |     |  |      movea.l 44(sp),a3
    if (BlitterControl::singleton==NULL) {
     4be:	|  |  |  |  |  |  |  |  |  |  |        /-----|--|--|--|--|-----|--|----> movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     4c4:	|  |  |  |  |  |  |  |  |  |  |        |     |  |  |  |  |     |  |      cmpa.w #0,a2
     4c8:	|  |  |  |  |  |  |  |  |  |  |  /-----|-----|--|--|--|--|-----|--|----- beq.w 6b0 <main+0x662>
    }
}

bool BlitterControl::isBlittingInProgress() {
    // readtwice cause of agnus bug on older machines
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     4cc:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-----|--|--|--|--|-----|--|----> movea.l 8(a2),a0
     4d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |      move.w 2(a0),d0
     4d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |      move.w 2(a0),d1
     4d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |      or.w d1,d0
    if (!isBlittingInProgress() && hasMoreScheduled() ) {
     4da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |      btst #14,d0
     4de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|--|----- bne.w 6fa <main+0x6ac>
    if (lastScheduledBlitable==NULL) {
     4e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-> tst.l 4(a2)
     4e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  +--|--|--|-- beq.w 6fa <main+0x6ac>
}

void BlitterControl::startNextBlit() {
    currentBlit=currentBlit->next;
     4ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |   movea.l (a2),a0
     4ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |   movea.l 4(a0),a0
     4f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |   move.l a0,(a2)
    if (currentBlit!=NULL) {
     4f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|-- beq.w 726 <main+0x6d8>
        currentBlit->prev=NULL;
     4f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   clr.l 8(a0)
        currentBlit->blit();
     4fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l (a0),a1
     4fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
     4fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l (a1),a0
     500:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a0)
     502:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,sp
    if (BlitterControl::singleton==NULL) {
     504:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     50a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmpa.w #0,a2
     50e:	|  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-- bne.s 4cc <main+0x47e>
     510:	|  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|-- bra.w 6b0 <main+0x662>
        tiles=new Tile*[numberOfTiles];
     514:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> moveq #-1,d5
     516:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \--|--|--|--|-- bra.w 37e <main+0x330>
    KPrintF("Operator new Called");
     51a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  \--|-> pea 12c3 <incbin_tilescolors_end+0x1>
     520:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     522:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l fe90 <SysBase>,a6
     528:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   moveq #12,d0
     52a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   moveq #0,d1
     52c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr -198(a6)
     530:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l d0,a2
BlitterControl::BlitterControl() {
     532:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   clr.l (a2)
     534:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     538:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   move.l #14675968,8(a2)
    OwnBlitter();
     540:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l 48(sp),a0
     544:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l (a0),a6
     546:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     54a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   move.l a2,fe98 <_ZN14BlitterControl9singletonE>
                BlitterControl::instance()->schedule(tiles[visibleWidth*y+x]);
     550:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l -4(a3),a6
    if (blit->prev!=NULL || currentBlit==blit) {
     554:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   addq.l #4,sp
     556:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   tst.l 8(a6)
     55a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  \-----|-- beq.w 484 <main+0x436>
            for (int x=0;x<visibleWidth;x++) {
     55e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   addq.l #1,d2
     560:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   cmp.l d6,d2
     562:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--------|--------|-- blt.w 3e8 <main+0x39a>
     566:	|  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--------|--------|-- bra.w 4a8 <main+0x45a>
    this->widthInBytes=width/8;
     56a:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|--|--|--------|--------|-> addq.l #7,d1
     56c:	|  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|--------|--------|-- bra.w 176 <main+0x128>
    visibleHeight=display->height/tileHeight;
     570:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--------|--------|-> moveq #31,d0
     572:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   add.l d2,d0
     574:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--------|--------|-- bra.w 358 <main+0x30a>
    visibleWidth=display->widthInBytes/tileWidthInBytes;
     578:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--------|--------|-> addq.l #3,d6
     57a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |        |        |   asr.l #2,d6
    visibleHeight=display->height/tileHeight;
     57c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |        |        |   move.l 26(a5),d2
     580:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |        |        |   move.l d2,d0
     582:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \--------|--------|-- bpl.w 358 <main+0x30a>
     586:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------------|--------|-- bra.s 570 <main+0x522>
		Exit(0);
     588:	>--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------------|--------|-> movea.l fe8c <DOSBase>,a6
     58e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   jsr -144(a6)
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     59a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   lea 132b <incbin_tilescolors_end+0x69>,a1
     5a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   moveq #0,d0
     5a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   jsr -552(a6)
     5a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |                 |        |   move.l d0,fe88 <GfxBase>
	if (!GfxBase)
     5ac:	|  |  |  |  |  |  \--|--|--|--|--|--|--|--|-----------------|--------|-- bne.w aa <main+0x5c>
     5b0:	|  |  |  |  |  +-----|--|--|--|--|--|--|--|-----------------|--------|-- bra.s 5d4 <main+0x586>
		Exit(0);
     5b2:	|  |  \--|--|--|-----|--|--|--|--|--|--|--|-----------------|--------|-> suba.l a6,a6
     5b4:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     5b6:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   jsr -144(a6)
	IntuitionBase = (struct IntuitionBase *)OpenLibrary((CONST_STRPTR)"intuition.library",0);
     5ba:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     5c0:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   lea 1319 <incbin_tilescolors_end+0x57>,a1
     5c6:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   moveq #0,d0
     5c8:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   jsr -552(a6)
	if (!IntuitionBase)
     5cc:	|  |     |  |  |     |  |  |  |  |  |  |  |                 |        |   tst.l d0
     5ce:	|  \-----|--|--|-----|--|--|--|--|--|--|--|-----------------|--------|-- bne.w 8e <main+0x40>
     5d2:	\--------|--|--|-----|--|--|--|--|--|--|--|-----------------|--------|-- bra.s 588 <main+0x53a>
		Exit(0);
     5d4:	         |  |  \-----|--|--|--|--|--|--|--|-----------------|--------|-> movea.l fe8c <DOSBase>,a6
     5da:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     5dc:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -144(a6)
    KPrintF("Started!\n");
     5e0:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 133c <incbin_tilescolors_end+0x7a>
     5e6:	         |  |        |  |  |  |  |  |  |  |                 |        |   lea 878 <KPrintF>,a4
     5ec:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a4)
            KPrintF("Application created!\n");
     5ee:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 1346 <incbin_tilescolors_end+0x84>
     5f4:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a4)
            SetTaskPri(FindTask(NULL), TASK_PRIORITY); // setting task priority >20, greater then all OS function, allows us to us OS even when progamming the hardware
     5f6:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     5fc:	         |  |        |  |  |  |  |  |  |  |                 |        |   suba.l a1,a1
     5fe:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -294(a6)
     602:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     608:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d0,a1
     60a:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #20,d0
     60c:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -300(a6)
    KPrintF("Operator new Called");
     610:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 12c3 <incbin_tilescolors_end+0x1>
     616:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     618:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     61e:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #8,d0
     620:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     622:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -198(a6)
     626:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d0,a5
    colors=palette;
     628:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l #4672,(a5)
    numberOfColors=colorCount;
     62e:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #32,d0
     630:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l d0,4(a5)
    KPrintF("Operator new Called");
     634:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 12c3 <incbin_tilescolors_end+0x1>
     63a:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     63c:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     642:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #8,d0
     644:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     646:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -198(a6)
     64a:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d0,a3
    colors=palette;
     64c:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l #4738,(a3)
    numberOfColors=colorCount;
     652:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #32,d1
     654:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l d1,4(a3)
    KPrintF("Operator new Called");
     658:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 12c3 <incbin_tilescolors_end+0x1>
     65e:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     660:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     666:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #40,d0
     668:	         |  |        |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     66a:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr -198(a6)
     66e:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d0,a2
    Display::Display(UWORD mode,bool interleaved) {
     670:	         |  |        |  |  |  |  |  |  |  |                 |        |   clr.b 38(a2)
        init(mode,interleaved);
     674:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 1 <_start+0x1>
     678:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 5000 <incbin_image_start+0x3000>
     67c:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l d0,-(sp)
     67e:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l #2024,d2
     684:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d2,a0
     686:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr (a0)
        bitplanes=new Bitplanes(image,width,height,numberOfBitplanes);
     688:	         |  |        |  |  |  |  |  |  |  |                 |        |   lea 32(sp),sp
     68c:	         |  |        |  |  |  |  |  |  |  |                 |        |   pea 26 <_start+0x26>
     690:	         |  |        |  |  |  |  |  |  |  |                 |        |   jsr 8ea <_Znwm>
     696:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l d0,a0
     698:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l 34(a2),d0
     69c:	         |  |        |  |  |  |  |  |  |  |                 |        |   movea.l 26(a2),a1
     6a0:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l 22(a2),d1
    this->width=width;
     6a4:	         |  |        |  |  |  |  |  |  |  |                 |        |   move.l d1,(a0)
    this->widthInBytes=width/8;
     6a6:	         |  |        |  |  |  |  |  |  |  |                 |        |   addq.l #4,sp
     6a8:	         |  \--------|--|--|--|--|--|--|--|-----------------|--------|-- bpl.w 176 <main+0x128>
     6ac:	         \-----------|--|--|--|--|--|--|--|-----------------|--------|-- bra.w 56a <main+0x51c>
    KPrintF("Operator new Called");
     6b0:	                     |  |  |  |  >--|--|--|-----------------|--------|-> pea 12c3 <incbin_tilescolors_end+0x1>
     6b6:	                     |  |  |  |  |  |  |  |                 |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     6b8:	                     |  |  |  |  |  |  |  |                 |        |   movea.l fe90 <SysBase>,a6
     6be:	                     |  |  |  |  |  |  |  |                 |        |   moveq #12,d0
     6c0:	                     |  |  |  |  |  |  |  |                 |        |   moveq #0,d1
     6c2:	                     |  |  |  |  |  |  |  |                 |        |   jsr -198(a6)
     6c6:	                     |  |  |  |  |  |  |  |                 |        |   movea.l d0,a2
BlitterControl::BlitterControl() {
     6c8:	                     |  |  |  |  |  |  |  |                 |        |   clr.l (a2)
     6ca:	                     |  |  |  |  |  |  |  |                 |        |   clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     6ce:	                     |  |  |  |  |  |  |  |                 |        |   move.l #14675968,8(a2)
    OwnBlitter();
     6d6:	                     |  |  |  |  |  |  |  |                 |        |   movea.l (a3),a6
     6d8:	                     |  |  |  |  |  |  |  |                 |        |   jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     6dc:	                     |  |  |  |  |  |  |  |                 |        |   move.l a2,fe98 <_ZN14BlitterControl9singletonE>
     6e2:	                     |  |  |  |  |  |  |  |                 |        |   addq.l #4,sp
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     6e4:	                     |  |  |  |  |  |  |  |                 |        |   movea.l 8(a2),a0
     6e8:	                     |  |  |  |  |  |  |  |                 |        |   move.w 2(a0),d0
     6ec:	                     |  |  |  |  |  |  |  |                 |        |   move.w 2(a0),d1
     6f0:	                     |  |  |  |  |  |  |  |                 |        |   or.w d1,d0
    if (!isBlittingInProgress() && hasMoreScheduled() ) {
     6f2:	                     |  |  |  |  |  |  |  |                 |        |   btst #14,d0
     6f6:	                     |  |  |  |  |  |  |  |                 |        \-- beq.w 4e2 <main+0x494>
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     6fa:	                     |  |  |  |  |  |  |  |                 \----------> move.w 2(a0),d0
     6fe:	                     |  |  |  |  |  |  |  |                              move.w 2(a0),d1
     702:	                     |  |  |  |  |  |  |  |                              or.w d1,d0
    } else if (isBlittingInProgress()) {
     704:	                     |  |  |  |  |  |  |  |                              btst #14,d0
     708:	                     |  |  |  |  |  |  \--|----------------------------- beq.w 4be <main+0x470>
        KPrintF("blitter busy\n");
     70c:	                     |  |  |  |  |  |     |                              pea 1372 <incbin_tilescolors_end+0xb0>
     712:	                     |  |  |  |  |  |     |                              jsr (a4)
     714:	                     |  |  |  |  |  |     |                              addq.l #4,sp
    if (BlitterControl::singleton==NULL) {
     716:	                     |  |  |  |  |  |     |                              movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     71c:	                     |  |  |  |  |  |     |                              cmpa.w #0,a2
     720:	                     |  |  |  |  |  +-----|----------------------------- bne.w 4cc <main+0x47e>
     724:	                     |  |  |  |  +--|-----|----------------------------- bra.s 6b0 <main+0x662>
    } else {
        lastScheduledBlitable=NULL;
     726:	                     |  |  |  |  |  |     \----------------------------> clr.l 4(a2)
    if (BlitterControl::singleton==NULL) {
     72a:	                     |  |  |  |  |  |                                    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     730:	                     |  |  |  |  |  |                                    cmpa.w #0,a2
     734:	                     |  |  |  |  |  +----------------------------------- bne.w 4cc <main+0x47e>
     738:	                     |  |  |  |  +--|----------------------------------- bra.w 6b0 <main+0x662>
            lastScheduledBlitable=blit;
     73c:	                     |  |  |  \--|--|----------------------------------> move.l a6,4(a2)
            currentBlit=blit;
     740:	                     |  |  |     |  |                                    move.l a6,(a2)
            currentBlit->blit();
     742:	                     |  |  |     |  |                                    movea.l (a6),a0
     744:	                     |  |  |     |  |                                    move.l a6,-(sp)
     746:	                     |  |  |     |  |                                    movea.l (a0),a0
     748:	                     |  |  |     |  |                                    jsr (a0)
}
     74a:	                     |  |  |     |  |                                    addq.l #4,sp
            for (int x=0;x<visibleWidth;x++) {
     74c:	                     |  |  |     |  |                                    addq.l #1,d2
     74e:	                     |  |  |     |  |                                    cmp.l d6,d2
     750:	                     |  \--|-----|--|----------------------------------- blt.w 3e8 <main+0x39a>
     754:	                     |     \-----|--|----------------------------------- bra.w 4a8 <main+0x45a>
     758:	                     \-----------|--|----------------------------------> move.l #65160,d5
     75e:	                                 |  |                                    movea.l d5,a3
    if (BlitterControl::singleton==NULL) {
     760:	                                 |  |                                    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     766:	                                 |  |                                    cmpa.w #0,a2
     76a:	                                 |  \----------------------------------- bne.w 4cc <main+0x47e>
     76e:	                                 \-------------------------------------- bra.w 6b0 <main+0x662>
     772:	                                                                         nop

00000774 <_ZN14BlitterControl8scheduleEP8Blitable>:
void BlitterControl::schedule(Blitable* blit){
     774:	       move.l a2,-(sp)
     776:	       movea.l 8(sp),a1
     77a:	       movea.l 12(sp),a0
    if (blit->prev!=NULL || currentBlit==blit) {
     77e:	       tst.l 8(a0)
     782:	   /-- beq.s 788 <_ZN14BlitterControl8scheduleEP8Blitable+0x14>
}
     784:	/--|-> movea.l (sp)+,a2
     786:	|  |   rts
    if (blit->prev!=NULL || currentBlit==blit) {
     788:	|  \-> cmpa.l (a1),a0
     78a:	\----- beq.s 784 <_ZN14BlitterControl8scheduleEP8Blitable+0x10>
    if (lastScheduledBlitable==NULL) {
     78c:	       movea.l 4(a1),a2
     790:	       cmpa.w #0,a2
     794:	   /-- beq.s 7a6 <_ZN14BlitterControl8scheduleEP8Blitable+0x32>
            blit->prev=lastScheduledBlitable;
     796:	   |   move.l a2,8(a0)
            lastScheduledBlitable->next=blit;
     79a:	   |   move.l a0,4(a2)
            lastScheduledBlitable=blit;
     79e:	   |   move.l a0,4(a1)
}
     7a2:	   |   movea.l (sp)+,a2
     7a4:	   |   rts
            lastScheduledBlitable=blit;
     7a6:	   \-> move.l a0,4(a1)
            currentBlit=blit;
     7aa:	       move.l a0,(a1)
            currentBlit->blit();
     7ac:	       movea.l (a0),a1
     7ae:	       move.l a0,8(sp)
     7b2:	       movea.l (a1),a1
}
     7b4:	       movea.l (sp)+,a2
            currentBlit->blit();
     7b6:	       jmp (a1)

000007b8 <_ZN10CopperList4moveEtt>:

    CopperList* CopperList::create() {
        return new CopperList();
    }

    CopperList* CopperList::move(UWORD customRegister, UWORD value) {
     7b8:	move.l a2,-(sp)
     7ba:	movea.l 8(sp),a1
     7be:	move.l 16(sp),d0
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     7c2:	movea.l 4(a1),a0
     7c6:	move.w 14(sp),(a0)
        *copPointer++=value;
     7ca:	lea 4(a0),a2
     7ce:	move.l a2,4(a1)
     7d2:	move.w d0,2(a0)
        *copPointer=0xffff;
     7d6:	move.w #-1,4(a0)
        *(copPointer+2)=0xfffe;
     7dc:	move.w #-2,8(a0)
        setEndOfList();
        return this;
    }
     7e2:	move.l a1,d0
     7e4:	movea.l (sp)+,a2
     7e6:	rts

000007e8 <_ZN7Display4initEtb>:
    void Display::init(UWORD mode,bool interleaved) {
     7e8:	    movem.l d2-d4/a2/a6,-(sp)
     7ec:	    movea.l 24(sp),a2
     7f0:	    move.l 28(sp),d2
     7f4:	    move.l 32(sp),d3
            custom = (struct Custom*)0xdff000;
     7f8:	    move.l #14675968,10(a2)
            bitplanes=NULL;
     800:	    clr.l (a2)
	        originalActiView=GfxBase->ActiView; //store current view
     802:	    movea.l fe88 <GfxBase>,a6
     808:	    move.l 34(a6),14(a2)
            LoadView(0);
     80e:	    suba.l a1,a1
     810:	    jsr -222(a6)
	        WaitTOF();
     814:	    movea.l fe88 <GfxBase>,a6
     81a:	    jsr -270(a6)
	        WaitTOF();
     81e:	    movea.l fe88 <GfxBase>,a6
     824:	    jsr -270(a6)
            if (modeid&HIRES) {
     828:	    move.l #640,d0
     82e:	    tst.w d2
     830:	/-- blt.s 838 <_ZN7Display4initEtb+0x50>
     832:	|   move.l #320,d0
            this->interleaved=interleaved;
     838:	\-> move.b d3,38(a2)
            this->modeid=mode;
     83c:	    move.w d2,4(a2)
                width=640;
     840:	    move.l d0,22(a2)
    UBYTE* Display::getBitplanes() {
        return bitplanes->getBitplanePointer(0);
    }

    bool Display::isPAL() {
        return (((struct GfxBase *)  GfxBase)->DisplayFlags & PAL) ==PAL;
     844:	    movea.l fe88 <GfxBase>,a0
     84a:	    moveq #55,d1
     84c:	    not.b d1
            if (isPAL()) {
     84e:	    btst #2,207(a0)
     854:	/-- beq.s 85c <_ZN7Display4initEtb+0x74>
     856:	|   move.l #256,d1
                height=256;
     85c:	\-> move.l d1,26(a2)
            widthInBytes=width/8;
     860:	    asr.l #3,d0
     862:	    move.l d0,30(a2)
            numberOfBitplanes=mode>>12&0b111;
     866:	    moveq #12,d0
     868:	    lsr.w d0,d2
     86a:	    moveq #7,d0
     86c:	    and.l d2,d0
     86e:	    move.l d0,34(a2)
    }
     872:	    movem.l (sp)+,d2-d4/a2/a6
     876:	    rts

00000878 <KPrintF>:
void KPrintF(const char* fmt, ...) {
     878:	    lea -128(sp),sp
     87c:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     880:	    move.w f0ff60 <gcc8_c_support.c.915a8519+0xefcdbd>,d0
     886:	    cmpi.w #20153,d0
     88a:	/-- beq.s 8b6 <KPrintF+0x3e>
     88c:	|   cmpi.w #-24562,d0
     890:	+-- beq.s 8b6 <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
     892:	|   movea.l fe90 <SysBase>,a6
     898:	|   movea.l 144(sp),a0
     89c:	|   lea 148(sp),a1
     8a0:	|   lea 115a <KPutCharX>,a2
     8a6:	|   suba.l a3,a3
     8a8:	|   jsr -522(a6)
}
     8ac:	|   movem.l (sp)+,a2-a3/a6
     8b0:	|   lea 128(sp),sp
     8b4:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
     8b6:	\-> movea.l fe90 <SysBase>,a6
     8bc:	    movea.l 144(sp),a0
     8c0:	    lea 148(sp),a1
     8c4:	    lea 1168 <PutChar>,a2
     8ca:	    lea 12(sp),a3
     8ce:	    jsr -522(a6)
		UaeDbgLog(86, temp);
     8d2:	    move.l a3,-(sp)
     8d4:	    pea 56 <main+0x8>
     8d8:	    jsr f0ff60 <gcc8_c_support.c.915a8519+0xefcdbd>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     8de:	    addq.l #8,sp
}
     8e0:	    movem.l (sp)+,a2-a3/a6
     8e4:	    lea 128(sp),sp
     8e8:	    rts

000008ea <_Znwm>:
{
     8ea:	move.l a6,-(sp)
    KPrintF("Operator new Called");
     8ec:	pea 12c3 <incbin_tilescolors_end+0x1>
     8f2:	jsr 878 <KPrintF>(pc)
    void *p = AllocMem( size, MEMF_ANY);
     8f6:	movea.l fe90 <SysBase>,a6
     8fc:	move.l 12(sp),d0
     900:	moveq #0,d1
     902:	jsr -198(a6)
    return p;
     906:	addq.l #4,sp
}
     908:	movea.l (sp)+,a6
     90a:	rts

0000090c <_ZN7Display4showEv>:
   void Display::show () {
     90c:	                   movem.l d2-d5/a2-a6,-(sp)
     910:	                   movea.l 40(sp),a2
    UBYTE* mem=(UBYTE *)AllocMem( (width/8)*height*numberOfBitplanes, MEMF_CHIP);
     914:	                   lea fe90 <SysBase>,a5
       if (bitplanes==NULL) {
     91a:	                   tst.l (a2)
     91c:	   /-------------- beq.w bea <_ZN7Display4showEv+0x2de>
     920:	   |               lea 8ea <_Znwm>(pc),a4
        return new CopperList();
     924:	/--|-------------> pea 8 <_start+0x8>
     928:	|  |               jsr (a4)
     92a:	|  |               movea.l d0,a3
        copperList= (USHORT*)AllocMem(1024, MEMF_CHIP);
     92c:	|  |               movea.l (a5),a6
     92e:	|  |               move.l #1024,d0
     934:	|  |               moveq #2,d1
     936:	|  |               jsr -198(a6)
     93a:	|  |               move.l d0,(a3)
        copPointer=copperList;  // sets pointer to start of list;
     93c:	|  |               move.l d0,4(a3)
            ->move(offsetof (struct Custom, bplcon0) , modeid);
     940:	|  |               pea 38 <_start+0x38>
     944:	|  |               pea 92 <main+0x44>
     948:	|  |               move.l a3,-(sp)
     94a:	|  |               lea 7b8 <_ZN10CopperList4moveEtt>(pc),a5
     94e:	|  |               jsr (a5)
     950:	|  |               pea d0 <main+0x82>
     954:	|  |               pea 94 <main+0x46>
     958:	|  |               move.l d0,-(sp)
     95a:	|  |               jsr (a5)
     95c:	|  |               pea 2c81 <incbin_image_start+0xc81>
     960:	|  |               pea 8e <main+0x40>
     964:	|  |               move.l d0,-(sp)
     966:	|  |               jsr (a5)
        return (((struct GfxBase *)  GfxBase)->DisplayFlags & PAL) ==PAL;
     968:	|  |               movea.l fe88 <GfxBase>,a0
            ->move(offsetof (struct Custom, bplcon0) , modeid);
     96e:	|  |               lea 40(sp),sp
     972:	|  |               move.l #11457,d1
     978:	|  |               btst #2,207(a0)
     97e:	|  |           /-- bne.s 986 <_ZN7Display4showEv+0x7a>
     980:	|  |           |   move.l #62657,d1
     986:	|  |           \-> move.l d1,-(sp)
     988:	|  |               pea 90 <main+0x42>
     98c:	|  |               move.l d0,-(sp)
     98e:	|  |               jsr (a5)
     990:	|  |               moveq #0,d1
     992:	|  |               move.w 4(a2),d1
     996:	|  |               move.l d1,-(sp)
     998:	|  |               pea 100 <main+0xb2>
     99c:	|  |               move.l d0,-(sp)
     99e:	|  |               jsr (a5)
     9a0:	|  |               movea.l d0,a3
                cl->move(offsetof (struct Custom, bpl1mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     )
     9a2:	|  |               move.l 34(a2),d2
            if (this->interleaved) {
     9a6:	|  |               lea 24(sp),sp
     9aa:	|  |               tst.b 38(a2)
     9ae:	|  |  /----------- beq.w b94 <_ZN7Display4showEv+0x288>
                cl->move(offsetof (struct Custom, bpl1mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     )
     9b2:	|  |  |            move.w d2,d3
     9b4:	|  |  |            subq.w #1,d3
     9b6:	|  |  |            muls.w 32(a2),d3
                  ->move(offsetof (struct Custom, bpl2mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     );
     9ba:	|  |  |            andi.l #65535,d3
     9c0:	|  |  |            move.l d3,-(sp)
     9c2:	|  |  |            pea 108 <main+0xba>
     9c6:	|  |  |            move.l d0,-(sp)
     9c8:	|  |  |            jsr (a5)
     9ca:	|  |  |            move.l d3,-(sp)
     9cc:	|  |  |            pea 10a <main+0xbc>
     9d0:	|  |  |            move.l d0,-(sp)
     9d2:	|  |  |            jsr (a5)
     9d4:	|  |  |            lea 24(sp),sp
            for (int i=0;i<numberOfBitplanes;i++) {
     9d8:	|  |  |  /-------> tst.l d2
     9da:	|  |  |  |  /----- ble.w afc <_ZN7Display4showEv+0x1f0>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
     9de:	|  |  |  |  |      movea.l (a2),a1
     9e0:	|  |  |  |  |      movea.l 4(a3),a0
     9e4:	|  |  |  |  |      move.l 16(a1),d1

    CopperList* CopperList::movePointer(UWORD customRegister, ULONG address) {
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     9e8:	|  |  |  |  |      move.w #224,(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     9ec:	|  |  |  |  |      move.l d1,d0
     9ee:	|  |  |  |  |      clr.w d0
     9f0:	|  |  |  |  |      swap d0
     9f2:	|  |  |  |  |      move.w d0,2(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     9f6:	|  |  |  |  |      move.w #226,4(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     9fc:	|  |  |  |  |      move.w d1,d0
     9fe:	|  |  |  |  |      move.w d1,6(a0)
        *copPointer=0xffff;
     a02:	|  |  |  |  |      move.w #-1,8(a0)
        *(copPointer+2)=0xfffe;
     a08:	|  |  |  |  |      move.w #-2,12(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     a0e:	|  |  |  |  |      moveq #1,d1
     a10:	|  |  |  |  |      cmp.l d2,d1
     a12:	|  |  |  |  |  /-- beq.w ada <_ZN7Display4showEv+0x1ce>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
     a16:	|  |  |  |  |  |   move.l 20(a1),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a1a:	|  |  |  |  |  |   move.w #228,8(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     a20:	|  |  |  |  |  |   move.l d1,d0
     a22:	|  |  |  |  |  |   clr.w d0
     a24:	|  |  |  |  |  |   swap d0
     a26:	|  |  |  |  |  |   move.w d0,10(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a2a:	|  |  |  |  |  |   move.w #230,12(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     a30:	|  |  |  |  |  |   move.w d1,d0
     a32:	|  |  |  |  |  |   move.w d1,14(a0)
        *copPointer=0xffff;
     a36:	|  |  |  |  |  |   move.w #-1,16(a0)
        *(copPointer+2)=0xfffe;
     a3c:	|  |  |  |  |  |   move.w #-2,20(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     a42:	|  |  |  |  |  |   moveq #2,d1
     a44:	|  |  |  |  |  |   cmp.l d2,d1
     a46:	|  |  |  |  |  +-- beq.w ada <_ZN7Display4showEv+0x1ce>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
     a4a:	|  |  |  |  |  |   move.l 24(a1),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a4e:	|  |  |  |  |  |   move.w #232,16(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     a54:	|  |  |  |  |  |   move.l d1,d0
     a56:	|  |  |  |  |  |   clr.w d0
     a58:	|  |  |  |  |  |   swap d0
     a5a:	|  |  |  |  |  |   move.w d0,18(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a5e:	|  |  |  |  |  |   move.w #234,20(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     a64:	|  |  |  |  |  |   move.w d1,d0
     a66:	|  |  |  |  |  |   move.w d1,22(a0)
        *copPointer=0xffff;
     a6a:	|  |  |  |  |  |   move.w #-1,24(a0)
        *(copPointer+2)=0xfffe;
     a70:	|  |  |  |  |  |   move.w #-2,28(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     a76:	|  |  |  |  |  |   moveq #3,d1
     a78:	|  |  |  |  |  |   cmp.l d2,d1
     a7a:	|  |  |  |  |  +-- beq.s ada <_ZN7Display4showEv+0x1ce>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
     a7c:	|  |  |  |  |  |   move.l 28(a1),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a80:	|  |  |  |  |  |   move.w #236,24(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     a86:	|  |  |  |  |  |   move.l d1,d0
     a88:	|  |  |  |  |  |   clr.w d0
     a8a:	|  |  |  |  |  |   swap d0
     a8c:	|  |  |  |  |  |   move.w d0,26(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     a90:	|  |  |  |  |  |   move.w #238,28(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     a96:	|  |  |  |  |  |   move.w d1,d0
     a98:	|  |  |  |  |  |   move.w d1,30(a0)
        *copPointer=0xffff;
     a9c:	|  |  |  |  |  |   move.w #-1,32(a0)
        *(copPointer+2)=0xfffe;
     aa2:	|  |  |  |  |  |   move.w #-2,36(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     aa8:	|  |  |  |  |  |   moveq #4,d1
     aaa:	|  |  |  |  |  |   cmp.l d2,d1
     aac:	|  |  |  |  |  +-- beq.s ada <_ZN7Display4showEv+0x1ce>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes->getBitplanePointer(i) );
     aae:	|  |  |  |  |  |   move.l 32(a1),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     ab2:	|  |  |  |  |  |   move.w #240,32(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     ab8:	|  |  |  |  |  |   move.l d1,d0
     aba:	|  |  |  |  |  |   clr.w d0
     abc:	|  |  |  |  |  |   swap d0
     abe:	|  |  |  |  |  |   move.w d0,34(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     ac2:	|  |  |  |  |  |   move.w #242,36(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     ac8:	|  |  |  |  |  |   move.w d1,d0
     aca:	|  |  |  |  |  |   move.w d1,38(a0)
        *copPointer=0xffff;
     ace:	|  |  |  |  |  |   move.w #-1,40(a0)
        *(copPointer+2)=0xfffe;
     ad4:	|  |  |  |  |  |   move.w #-2,44(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     ada:	|  |  |  |  |  \-> move.l d2,d1
     adc:	|  |  |  |  |      subq.l #1,d1
     ade:	|  |  |  |  |      lsl.l #3,d1
     ae0:	|  |  |  |  |      lea (0,a0,d1.l),a1
        *copPointer++=(UWORD)(address  ) & 0xffff;
     ae4:	|  |  |  |  |      lsl.l #3,d2
     ae6:	|  |  |  |  |      add.l a0,d2
     ae8:	|  |  |  |  |      move.l d2,4(a3)
     aec:	|  |  |  |  |      move.w d0,6(a1)
     af0:	|  |  |  |  |      move.w #-1,8(a1)
     af6:	|  |  |  |  |      move.w #-2,12(a1)
            if (colorPalette!=NULL) {
     afc:	|  |  |  |  \----> movea.l 6(a2),a0
     b00:	|  |  |  |         cmpa.w #0,a0
     b04:	|  |  |  |  /----- beq.s b60 <_ZN7Display4showEv+0x254>
}

void ColorPalette::appendtoCopper(CopperList* copperList) {
    UWORD reg=0x180;
    for (int i=0; i<numberOfColors; i++) {
     b06:	|  |  |  |  |      move.l 4(a0),d2
     b0a:	|  |  |  |  +----- ble.s b60 <_ZN7Display4showEv+0x254>
     b0c:	|  |  |  |  |      move.l 4(a3),d3
     b10:	|  |  |  |  |      movea.l (a0),a1
     b12:	|  |  |  |  |      movea.l d2,a5
     b14:	|  |  |  |  |      adda.l d2,a5
     b16:	|  |  |  |  |      move.l a5,d5
     b18:	|  |  |  |  |      add.l a1,d5
        copperList->move(reg,   ((USHORT*)colors)[i]) ;
     b1a:	|  |  |  |  |      movea.l d3,a0
     b1c:	|  |  |  |  |      move.w #384,d4
     b20:	|  |  |  |  |      sub.w a1,d4
     b22:	|  |  |  |  |  /-> move.w d4,d0
     b24:	|  |  |  |  |  |   add.w a1,d0
     b26:	|  |  |  |  |  |   move.w (a1)+,d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b28:	|  |  |  |  |  |   move.w d0,(a0)
     b2a:	|  |  |  |  |  |   addq.l #4,a0
        *copPointer++=value;
     b2c:	|  |  |  |  |  |   move.w d1,-2(a0)
        *copPointer=0xffff;
     b30:	|  |  |  |  |  |   move.w #-1,(a0)
        *(copPointer+2)=0xfffe;
     b34:	|  |  |  |  |  |   move.w #-2,4(a0)
    for (int i=0; i<numberOfColors; i++) {
     b3a:	|  |  |  |  |  |   cmp.l a1,d5
     b3c:	|  |  |  |  |  \-- bne.s b22 <_ZN7Display4showEv+0x216>
     b3e:	|  |  |  |  |      movea.l d2,a0
     b40:	|  |  |  |  |      subq.l #1,a0
     b42:	|  |  |  |  |      adda.l a0,a0
     b44:	|  |  |  |  |      adda.l a0,a0
     b46:	|  |  |  |  |      adda.l d3,a0
        *copPointer++=value;
     b48:	|  |  |  |  |      adda.l a5,a5
     b4a:	|  |  |  |  |      add.l a5,d3
     b4c:	|  |  |  |  |      move.l d3,4(a3)
     b50:	|  |  |  |  |      move.w d1,2(a0)
     b54:	|  |  |  |  |      move.w #-1,4(a0)
     b5a:	|  |  |  |  |      move.w #-2,8(a0)
        copperList=buildCopperList();
     b60:	|  |  |  |  \----> move.l a3,18(a2)
        KPrintF("free resources for Copper Singleton");
    }

 
    Copper* Copper::instance(){
        if (Copper::singleton==NULL) {
     b64:	|  |  |  |         movea.l fe94 <_ZN6Copper9singletonE>,a0
     b6a:	|  |  |  |         cmpa.w #0,a0
     b6e:	|  |  |  |     /-- beq.s bb0 <_ZN7Display4showEv+0x2a4>
            Copper::singleton=new Copper;
        }
        return Copper::singleton;
     b70:	|  |  |  |     |   movea.l (a0),a0
        return (ULONG) copperList;
     b72:	|  |  |  |     |   move.l (a3),d0
    void Copper::useCopperList(ULONG copperList) {
        custom->cop1lc = copperList;
    }

    void Copper::useCopperList(CopperList* copperList) {
        custom->cop1lc = copperList->getCopperListPointer();
     b74:	|  |  |  |     |   move.l d0,128(a0)
        custom->dmacon = DMAF_BLITTER;//disable blitter dma for copjmp bug
     b78:	|  |  |  |     |   movea.l 10(a2),a0
     b7c:	|  |  |  |     |   move.w #64,150(a0)
	    custom->copjmp1 = 0x7fff; //start coppper
     b82:	|  |  |  |     |   move.w #32767,136(a0)
	    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;
     b88:	|  |  |  |     |   move.w #-31808,150(a0)
    }
     b8e:	|  |  |  |     |   movem.l (sp)+,d2-d5/a2-a6
     b92:	|  |  |  |     |   rts
                  ->move(offsetof (struct Custom, bpl2mod),   0x0     );
     b94:	|  |  \--|-----|-> clr.l -(sp)
     b96:	|  |     |     |   pea 108 <main+0xba>
     b9a:	|  |     |     |   move.l d0,-(sp)
     b9c:	|  |     |     |   jsr (a5)
     b9e:	|  |     |     |   clr.l -(sp)
     ba0:	|  |     |     |   pea 10a <main+0xbc>
     ba4:	|  |     |     |   move.l d0,-(sp)
     ba6:	|  |     |     |   jsr (a5)
     ba8:	|  |     |     |   lea 24(sp),sp
     bac:	|  |     \-----|-- bra.w 9d8 <_ZN7Display4showEv+0xcc>
            Copper::singleton=new Copper;
     bb0:	|  |           \-> pea 4 <_start+0x4>
     bb4:	|  |               jsr (a4)
     bb6:	|  |               movea.l d0,a0
        custom = (struct Custom*)0xdff000;
     bb8:	|  |               move.l #14675968,(a0)
            Copper::singleton=new Copper;
     bbe:	|  |               move.l d0,fe94 <_ZN6Copper9singletonE>
     bc4:	|  |               addq.l #4,sp
        return Copper::singleton;
     bc6:	|  |               movea.l (a0),a0
        return (ULONG) copperList;
     bc8:	|  |               move.l (a3),d0
        custom->cop1lc = copperList->getCopperListPointer();
     bca:	|  |               move.l d0,128(a0)
        custom->dmacon = DMAF_BLITTER;//disable blitter dma for copjmp bug
     bce:	|  |               movea.l 10(a2),a0
     bd2:	|  |               move.w #64,150(a0)
	    custom->copjmp1 = 0x7fff; //start coppper
     bd8:	|  |               move.w #32767,136(a0)
	    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;
     bde:	|  |               move.w #-31808,150(a0)
    }
     be4:	|  |               movem.l (sp)+,d2-d5/a2-a6
     be8:	|  |               rts
     bea:	|  \-------------> movea.l (a5),a6
           bitplanes=new Bitplanes(width,height,numberOfBitplanes);
     bec:	|                  pea 26 <_start+0x26>
     bf0:	|                  lea 8ea <_Znwm>(pc),a4
     bf4:	|                  jsr (a4)
     bf6:	|                  movea.l d0,a3
     bf8:	|                  move.l 34(a2),d2
     bfc:	|                  move.l 26(a2),d1
     c00:	|                  move.l 22(a2),d0
    this->width=width;
     c04:	|                  move.l d0,(a3)
    this->widthInBytes=width/8;
     c06:	|                  addq.l #4,sp
     c08:	|     /----------- bmi.s c78 <_ZN7Display4showEv+0x36c>
     c0a:	|  /--|----------> asr.l #3,d0
     c0c:	|  |  |            move.l d0,12(a3)
    this->height=height;
     c10:	|  |  |            move.l d1,4(a3)
    this->numberOfBitplanes=numberOfBitplanes;
     c14:	|  |  |            move.l d2,8(a3)
Bitplanes::Bitplanes(int width, int height, int numberOfBitplanes) : Viewport(width,height,numberOfBitplanes) {
     c18:	|  |  |            move.b #1,36(a3)
    UBYTE* mem=(UBYTE *)AllocMem( (width/8)*height*numberOfBitplanes, MEMF_CHIP);
     c1e:	|  |  |            move.l #4192,d4
     c24:	|  |  |            move.l d0,-(sp)
     c26:	|  |  |            move.l d1,-(sp)
     c28:	|  |  |            movea.l d4,a0
     c2a:	|  |  |            jsr (a0)
     c2c:	|  |  |            addq.l #4,sp
     c2e:	|  |  |            move.l d2,(sp)
     c30:	|  |  |            move.l d0,-(sp)
     c32:	|  |  |            movea.l d4,a0
     c34:	|  |  |            jsr (a0)
     c36:	|  |  |            addq.l #8,sp
     c38:	|  |  |            moveq #2,d1
     c3a:	|  |  |            jsr -198(a6)
     c3e:	|  |  |            move.l d0,d2
    int bitplanesize=widthInBytes*height;
     c40:	|  |  |            move.l 12(a3),d3
     c44:	|  |  |            move.l 4(a3),-(sp)
     c48:	|  |  |            move.l d3,-(sp)
     c4a:	|  |  |            movea.l d4,a0
     c4c:	|  |  |            jsr (a0)
     c4e:	|  |  |            addq.l #8,sp
        for (int i=0;i<numberOfBitplanes;i++) {
     c50:	|  |  |            movea.l 8(a3),a1
     c54:	|  |  |            cmpa.w #0,a1
     c58:	|  |  |  /-------- ble.s c72 <_ZN7Display4showEv+0x366>
     c5a:	|  |  |  |         move.l d2,d1
     c5c:	|  |  |  |         tst.b 36(a3)
     c60:	|  |  |  |  /----- bne.s c7c <_ZN7Display4showEv+0x370>
     c62:	|  |  |  |  |      lea 16(a3),a6
     c66:	|  |  |  |  |      suba.l a0,a0
                bitplanes[i]=(UBYTE*)(mem + bitplanesize * i);
     c68:	|  |  |  |  |  /-> move.l d1,(a6)+
        for (int i=0;i<numberOfBitplanes;i++) {
     c6a:	|  |  |  |  |  |   addq.l #1,a0
     c6c:	|  |  |  |  |  |   add.l d0,d1
     c6e:	|  |  |  |  |  |   cmpa.l a0,a1
     c70:	|  |  |  |  |  \-- bne.s c68 <_ZN7Display4showEv+0x35c>
     c72:	|  |  |  >--|----> move.l a3,(a2)
     c74:	\--|--|--|--|----- bra.w 924 <_ZN7Display4showEv+0x18>
    this->widthInBytes=width/8;
     c78:	   |  \--|--|----> addq.l #7,d0
     c7a:	   \-----|--|----- bra.s c0a <_ZN7Display4showEv+0x2fe>
     c7c:	         |  \----> lea 16(a3),a0
     c80:	         |         moveq #0,d0
                bitplanes[i]=(UBYTE*)(mem + bitplanesize * i);
     c82:	         |     /-> move.l d1,(a0)+
        for (int i=0;i<numberOfBitplanes;i++) {
     c84:	         |     |   addq.l #1,d0
     c86:	         |     |   add.l d3,d1
     c88:	         |     |   cmpa.l d0,a1
     c8a:	         +-----|-- beq.s c72 <_ZN7Display4showEv+0x366>
                bitplanes[i]=(UBYTE*)(mem + bitplanesize * i);
     c8c:	         |     |   move.l d1,(a0)+
        for (int i=0;i<numberOfBitplanes;i++) {
     c8e:	         |     |   addq.l #1,d0
     c90:	         |     |   add.l d3,d1
     c92:	         |     |   cmpa.l d0,a1
     c94:	         |     \-- bne.s c82 <_ZN7Display4showEv+0x376>
     c96:	         \-------- bra.s c72 <_ZN7Display4showEv+0x366>

00000c98 <_ZN12TestBlitable4blitEv>:
            KPrintF("Blit Object\n");
     c98:	move.l #4823,4(sp)
     ca0:	bra.w 878 <KPrintF>

00000ca4 <_ZN15ClearDisplayJob4blitEv>:
            KPrintF("clear display\n");
     ca4:	pea 12e4 <incbin_tilescolors_end+0x22>
     caa:	jsr 878 <KPrintF>(pc)
            custom->bltcon0 = A_TO_D | DEST;
     cae:	movea.l 8(sp),a0
     cb2:	movea.l 12(a0),a0
     cb6:	move.w #496,64(a0)
            custom->bltcon1 = 0;
     cbc:	move.w #0,66(a0)
            custom->bltadat = 0x0;
     cc2:	move.w #0,116(a0)
            custom->bltdpt = (APTR)image + 320 / 8 * 200 * 5;
     cc8:	move.l #48192,84(a0)
            custom->bltdmod = 0;
     cd0:	move.w #0,102(a0)
            custom->bltafwm = custom->bltalwm = 0xffff;
     cd6:	move.w #-1,70(a0)
     cdc:	move.w #-1,68(a0)
            custom->bltsize = ((56 * 5) << HSIZEBITS) | (320/16);
     ce2:	move.w #17940,88(a0)
        }
     ce8:	addq.l #4,sp
     cea:	rts

00000cec <_ZN17CookieCutBlitTest4blitEv>:
            KPrintF("blit test bob\n");
     cec:	pea 12f3 <incbin_tilescolors_end+0x31>
     cf2:	jsr 878 <KPrintF>(pc)
			custom->bltapt = src;
     cf6:	movea.l 8(sp),a0
     cfa:	movea.l 12(a0),a0
     cfe:	move.l #59394,80(a0)
			custom->bltamod = (UWORD) 32 / 8;
     d06:	move.w #4,100(a0)
			custom->bltbpt = (APTR) src + 32 / 8 * 1;
     d0c:	move.l #59398,76(a0)
			custom->bltbmod = (UWORD) 32 / 8;
     d14:	move.w #4,98(a0)
			custom->bltcpt = custom->bltdpt =  (APTR)image + 320 / 8 * 5 * (256 + y) + x / 8;
     d1a:	move.l #59392,84(a0)
     d22:	move.l #59392,72(a0)
			custom->bltcmod = custom->bltdmod = (UWORD) (320 - 32) / 8;
     d2a:	move.w #36,102(a0)
     d30:	move.w #36,96(a0)
			custom->bltafwm = custom->bltalwm = 0xffff;
     d36:	move.w #-1,70(a0)
     d3c:	move.w #-1,68(a0)
			custom->bltcon0 = 0xca | SRCA | SRCB | SRCC | DEST | ((x & 15) << ASHIFTSHIFT); // A = source, B = mask, C = background, D = destination
     d42:	move.w #4042,64(a0)
			custom->bltcon1 = ((x & 15) << BSHIFTSHIFT);
     d48:	move.w #0,66(a0)
			custom->bltsize = ((16 * 5) << HSIZEBITS) | (32/16);
     d4e:	move.w #5122,88(a0)
        }
     d54:	addq.l #4,sp
     d56:	rts

00000d58 <_ZN14BlitterControl8instanceEv>:
BlitterControl* BlitterControl::instance(){
     d58:	    move.l a6,-(sp)
     d5a:	    move.l a2,-(sp)
    if (BlitterControl::singleton==NULL) {
     d5c:	    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     d62:	    cmpa.w #0,a2
     d66:	/-- beq.s d70 <_ZN14BlitterControl8instanceEv+0x18>
}
     d68:	|   move.l a2,d0
     d6a:	|   movea.l (sp)+,a2
     d6c:	|   movea.l (sp)+,a6
     d6e:	|   rts
    KPrintF("Operator new Called");
     d70:	\-> pea 12c3 <incbin_tilescolors_end+0x1>
     d76:	    jsr 878 <KPrintF>(pc)
    void *p = AllocMem( size, MEMF_ANY);
     d7a:	    movea.l fe90 <SysBase>,a6
     d80:	    moveq #12,d0
     d82:	    moveq #0,d1
     d84:	    jsr -198(a6)
     d88:	    movea.l d0,a2
BlitterControl::BlitterControl() {
     d8a:	    clr.l (a2)
     d8c:	    clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     d90:	    move.l #14675968,8(a2)
    OwnBlitter();
     d98:	    movea.l fe88 <GfxBase>,a6
     d9e:	    jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     da2:	    move.l a2,fe98 <_ZN14BlitterControl9singletonE>
     da8:	    addq.l #4,sp
}
     daa:	    move.l a2,d0
     dac:	    movea.l (sp)+,a2
     dae:	    movea.l (sp)+,a6
     db0:	    rts

00000db2 <_ZN4Tile4blitEv>:
}

void Tile::blit()  {
     db2:	move.l a2,-(sp)
     db4:	movea.l 8(sp),a2
            KPrintF("Copy tile\n");
     db8:	pea 1302 <incbin_tilescolors_end+0x40>
     dbe:	jsr 878 <KPrintF>(pc)
            custom->bltadat = 0xf0;
     dc2:	movea.l 12(a2),a0
     dc6:	move.w #240,116(a0)
       // dma src B & C disabled so set all dat bits  for  channels per convention
            custom->bltbdat = 0xffff;
     dcc:	move.w #-1,114(a0)
            custom->bltcdat = 0xffff;
     dd2:	move.w #-1,112(a0)

            custom->bltcon0 = A_TO_D | SRCA | DEST; // 0x00f0;
     dd8:	move.w #2544,64(a0)
            custom->bltcon1 = 0;
     dde:	move.w #0,66(a0)
            custom->bltafwm = custom->bltalwm = 0xffff;
     de4:	move.w #-1,70(a0)
     dea:	move.w #-1,68(a0)
            custom->bltamod = (UWORD) 0;
     df0:	move.w #0,100(a0)
            custom->bltdmod = (UWORD) display->widthInBytes - tileWidthInBytes;
     df6:	movea.l 16(a2),a1
     dfa:	move.w 32(a1),d0
     dfe:	sub.w 24(a2),d0
     e02:	move.w d0,102(a0)

            custom->bltapt = this->tilePointer;
     e06:	move.l 50(a2),80(a0)
    return bitplanes[index];
     e0c:	movea.l (a1),a1
            custom->bltdpt = ((UBYTE*) display->getBitplanes()) + xPosOffset + yPosOffset; //  320 / 8 * 200 * 5;
     e0e:	move.l 38(a2),d0
     e12:	add.l 42(a2),d0
     e16:	add.l 16(a1),d0
     e1a:	move.l d0,84(a0)

            custom->bltsize = (UWORD) ((tileHeight  * 5) << HSIZEBITS) | (tileWidthInWords);
     e1e:	move.w 22(a2),d0
     e22:	add.w d0,d0
     e24:	add.w d0,d0
     e26:	add.w 22(a2),d0
     e2a:	lsl.w #6,d0
     e2c:	or.w 26(a2),d0
     e30:	move.w d0,88(a0)
}
     e34:	addq.l #4,sp
     e36:	movea.l (sp)+,a2
     e38:	rts

00000e3a <strlen>:
unsigned long strlen(const char* s) {
     e3a:	       movea.l 4(sp),a0
	unsigned long t=0;
     e3e:	       moveq #0,d0
	while(*s++)
     e40:	       tst.b (a0)
     e42:	/----- beq.s e4c <strlen+0x12>
		t++;
     e44:	|  /-> addq.l #1,d0
	while(*s++)
     e46:	|  |   tst.b (0,a0,d0.l)
     e4a:	|  \-- bne.s e44 <strlen+0xa>
}
     e4c:	\----> rts

00000e4e <memset>:
	void* memset(void *dest, int val, unsigned long len) {
     e4e:	          movem.l d2-d7/a2-a3,-(sp)
     e52:	          move.l 36(sp),d0
     e56:	          move.l 40(sp),d4
     e5a:	          movea.l 44(sp),a1
	while(len-- > 0)
     e5e:	          move.l a1,d5
     e60:	          subq.l #1,d5
     e62:	          cmpa.w #0,a1
     e66:	/-------- beq.w f16 <memset+0xc8>
		*ptr++ = val;
     e6a:	|         move.b d4,d7
     e6c:	|         move.l d0,d1
     e6e:	|         neg.l d1
     e70:	|         moveq #3,d2
     e72:	|         and.l d2,d1
     e74:	|         moveq #5,d6
     e76:	|         movea.l d0,a2
     e78:	|         cmp.l d5,d6
     e7a:	|  /----- bcc.s ee6 <memset+0x98>
     e7c:	|  |      tst.l d1
     e7e:	|  |  /-- beq.s ea4 <memset+0x56>
     e80:	|  |  |   move.b d4,(a2)+
	while(len-- > 0)
     e82:	|  |  |   subq.l #1,d5
     e84:	|  |  |   moveq #1,d2
     e86:	|  |  |   cmp.l d1,d2
     e88:	|  |  +-- beq.s ea4 <memset+0x56>
		*ptr++ = val;
     e8a:	|  |  |   movea.l d0,a2
     e8c:	|  |  |   addq.l #2,a2
     e8e:	|  |  |   movea.l d0,a0
     e90:	|  |  |   move.b d4,1(a0)
	while(len-- > 0)
     e94:	|  |  |   subq.l #1,d5
     e96:	|  |  |   moveq #3,d2
     e98:	|  |  |   cmp.l d1,d2
     e9a:	|  |  +-- bne.s ea4 <memset+0x56>
		*ptr++ = val;
     e9c:	|  |  |   addq.l #1,a2
     e9e:	|  |  |   move.b d4,2(a0)
	while(len-- > 0)
     ea2:	|  |  |   subq.l #1,d5
     ea4:	|  |  \-> move.l a1,d3
     ea6:	|  |      sub.l d1,d3
     ea8:	|  |      moveq #0,d6
     eaa:	|  |      move.b d4,d6
     eac:	|  |      move.l d6,d2
     eae:	|  |      swap d2
     eb0:	|  |      clr.w d2
     eb2:	|  |      movea.l d2,a0
     eb4:	|  |      move.l d4,d2
     eb6:	|  |      lsl.w #8,d2
     eb8:	|  |      swap d2
     eba:	|  |      clr.w d2
     ebc:	|  |      lsl.l #8,d6
     ebe:	|  |      movea.l d6,a3
     ec0:	|  |      move.l a0,d6
     ec2:	|  |      or.l d6,d2
     ec4:	|  |      move.l a3,d6
     ec6:	|  |      or.l d6,d2
     ec8:	|  |      move.b d7,d2
     eca:	|  |      movea.l d0,a0
     ecc:	|  |      adda.l d1,a0
     ece:	|  |      moveq #-4,d1
     ed0:	|  |      and.l d3,d1
     ed2:	|  |      add.l a0,d1
		*ptr++ = val;
     ed4:	|  |  /-> move.l d2,(a0)+
	while(len-- > 0)
     ed6:	|  |  |   cmp.l a0,d1
     ed8:	|  |  \-- bne.s ed4 <memset+0x86>
     eda:	|  |      moveq #-4,d1
     edc:	|  |      and.l d3,d1
     ede:	|  |      adda.l d1,a2
     ee0:	|  |      sub.l d1,d5
     ee2:	|  |      cmp.l d3,d1
     ee4:	+--|----- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     ee6:	|  \----> move.b d4,(a2)
	while(len-- > 0)
     ee8:	|         tst.l d5
     eea:	+-------- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     eec:	|         move.b d4,1(a2)
	while(len-- > 0)
     ef0:	|         moveq #1,d1
     ef2:	|         cmp.l d5,d1
     ef4:	+-------- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     ef6:	|         move.b d4,2(a2)
	while(len-- > 0)
     efa:	|         moveq #2,d2
     efc:	|         cmp.l d5,d2
     efe:	+-------- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     f00:	|         move.b d4,3(a2)
	while(len-- > 0)
     f04:	|         moveq #3,d6
     f06:	|         cmp.l d5,d6
     f08:	+-------- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     f0a:	|         move.b d4,4(a2)
	while(len-- > 0)
     f0e:	|         subq.l #4,d5
     f10:	+-------- beq.s f16 <memset+0xc8>
		*ptr++ = val;
     f12:	|         move.b d4,5(a2)
}
     f16:	\-------> movem.l (sp)+,d2-d7/a2-a3
     f1a:	          rts

00000f1c <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
     f1c:	          movem.l d2-d6,-(sp)
     f20:	          move.l 24(sp),d0
     f24:	          move.l 28(sp),d1
     f28:	          move.l 32(sp),d3
	while(len--)
     f2c:	          move.l d3,d4
     f2e:	          subq.l #1,d4
     f30:	          tst.l d3
     f32:	/-------- beq.s f92 <memcpy+0x76>
     f34:	|         movea.l d1,a0
     f36:	|         addq.l #1,a0
     f38:	|         move.l d0,d2
     f3a:	|         sub.l a0,d2
     f3c:	|         moveq #2,d5
     f3e:	|         cmp.l d2,d5
     f40:	|         sc.s d2
     f42:	|         neg.b d2
     f44:	|         moveq #6,d6
     f46:	|         cmp.l d4,d6
     f48:	|         sc.s d5
     f4a:	|         neg.b d5
     f4c:	|         and.b d5,d2
     f4e:	|  /----- beq.s f98 <memcpy+0x7c>
     f50:	|  |      move.l d0,d2
     f52:	|  |      or.l d1,d2
     f54:	|  |      moveq #3,d5
     f56:	|  |      and.l d5,d2
     f58:	|  +----- bne.s f98 <memcpy+0x7c>
     f5a:	|  |      movea.l d1,a0
     f5c:	|  |      movea.l d0,a1
     f5e:	|  |      moveq #-4,d2
     f60:	|  |      and.l d3,d2
     f62:	|  |      add.l d1,d2
		*d++ = *s++;
     f64:	|  |  /-> move.l (a0)+,(a1)+
	while(len--)
     f66:	|  |  |   cmp.l a0,d2
     f68:	|  |  \-- bne.s f64 <memcpy+0x48>
     f6a:	|  |      moveq #-4,d2
     f6c:	|  |      and.l d3,d2
     f6e:	|  |      movea.l d0,a0
     f70:	|  |      adda.l d2,a0
     f72:	|  |      add.l d2,d1
     f74:	|  |      sub.l d2,d4
     f76:	|  |      cmp.l d3,d2
     f78:	+--|----- beq.s f92 <memcpy+0x76>
		*d++ = *s++;
     f7a:	|  |      movea.l d1,a1
     f7c:	|  |      move.b (a1),(a0)
	while(len--)
     f7e:	|  |      tst.l d4
     f80:	+--|----- beq.s f92 <memcpy+0x76>
		*d++ = *s++;
     f82:	|  |      move.b 1(a1),1(a0)
	while(len--)
     f88:	|  |      subq.l #1,d4
     f8a:	+--|----- beq.s f92 <memcpy+0x76>
		*d++ = *s++;
     f8c:	|  |      move.b 2(a1),2(a0)
}
     f92:	>--|----> movem.l (sp)+,d2-d6
     f96:	|  |      rts
     f98:	|  \----> movea.l d0,a1
     f9a:	|         add.l d3,d1
		*d++ = *s++;
     f9c:	|     /-> move.b -1(a0),(a1)+
	while(len--)
     fa0:	|     |   cmpa.l d1,a0
     fa2:	\-----|-- beq.s f92 <memcpy+0x76>
     fa4:	      |   addq.l #1,a0
     fa6:	      \-- bra.s f9c <memcpy+0x80>

00000fa8 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
     fa8:	             movem.l d2-d5/a2,-(sp)
     fac:	             move.l 24(sp),d0
     fb0:	             move.l 28(sp),d1
     fb4:	             move.l 32(sp),d2
		while (len--)
     fb8:	             movea.l d2,a1
     fba:	             subq.l #1,a1
	if (d < s) {
     fbc:	             cmp.l d0,d1
     fbe:	      /----- bls.s 102c <memmove+0x84>
		while (len--)
     fc0:	      |      tst.l d2
     fc2:	/-----|----- beq.s 1026 <memmove+0x7e>
     fc4:	|     |      movea.l d1,a2
     fc6:	|     |      addq.l #1,a2
     fc8:	|     |      move.l d0,d3
     fca:	|     |      sub.l a2,d3
     fcc:	|     |      moveq #2,d4
     fce:	|     |      cmp.l d3,d4
     fd0:	|     |      sc.s d3
     fd2:	|     |      neg.b d3
     fd4:	|     |      moveq #6,d5
     fd6:	|     |      cmp.l a1,d5
     fd8:	|     |      sc.s d4
     fda:	|     |      neg.b d4
     fdc:	|     |      and.b d4,d3
     fde:	|  /--|----- beq.s 1050 <memmove+0xa8>
     fe0:	|  |  |      move.l d0,d3
     fe2:	|  |  |      or.l d1,d3
     fe4:	|  |  |      moveq #3,d4
     fe6:	|  |  |      and.l d4,d3
     fe8:	|  +--|----- bne.s 1050 <memmove+0xa8>
     fea:	|  |  |      movea.l d1,a0
     fec:	|  |  |      movea.l d0,a2
     fee:	|  |  |      moveq #-4,d3
     ff0:	|  |  |      and.l d2,d3
     ff2:	|  |  |      add.l d1,d3
			*d++ = *s++;
     ff4:	|  |  |  /-> move.l (a0)+,(a2)+
		while (len--)
     ff6:	|  |  |  |   cmp.l a0,d3
     ff8:	|  |  |  \-- bne.s ff4 <memmove+0x4c>
     ffa:	|  |  |      moveq #-4,d3
     ffc:	|  |  |      and.l d2,d3
     ffe:	|  |  |      movea.l d0,a2
    1000:	|  |  |      adda.l d3,a2
    1002:	|  |  |      movea.l d1,a0
    1004:	|  |  |      adda.l d3,a0
    1006:	|  |  |      suba.l d3,a1
    1008:	|  |  |      cmp.l d2,d3
    100a:	+--|--|----- beq.s 1026 <memmove+0x7e>
			*d++ = *s++;
    100c:	|  |  |      move.b (a0),(a2)
		while (len--)
    100e:	|  |  |      cmpa.w #0,a1
    1012:	+--|--|----- beq.s 1026 <memmove+0x7e>
			*d++ = *s++;
    1014:	|  |  |      move.b 1(a0),1(a2)
		while (len--)
    101a:	|  |  |      moveq #1,d5
    101c:	|  |  |      cmp.l a1,d5
    101e:	+--|--|----- beq.s 1026 <memmove+0x7e>
			*d++ = *s++;
    1020:	|  |  |      move.b 2(a0),2(a2)
}
    1026:	>--|--|----> movem.l (sp)+,d2-d5/a2
    102a:	|  |  |      rts
		const char *lasts = s + (len - 1);
    102c:	|  |  \----> lea (0,a1,d1.l),a0
		char *lastd = d + (len - 1);
    1030:	|  |         adda.l d0,a1
		while (len--)
    1032:	|  |         tst.l d2
    1034:	+--|-------- beq.s 1026 <memmove+0x7e>
    1036:	|  |         move.l a0,d1
    1038:	|  |         sub.l d2,d1
			*lastd-- = *lasts--;
    103a:	|  |     /-> move.b (a0),(a1)
		while (len--)
    103c:	|  |     |   subq.l #1,a0
    103e:	|  |     |   subq.l #1,a1
    1040:	|  |     |   cmp.l a0,d1
    1042:	+--|-----|-- beq.s 1026 <memmove+0x7e>
			*lastd-- = *lasts--;
    1044:	|  |     |   move.b (a0),(a1)
		while (len--)
    1046:	|  |     |   subq.l #1,a0
    1048:	|  |     |   subq.l #1,a1
    104a:	|  |     |   cmp.l a0,d1
    104c:	|  |     \-- bne.s 103a <memmove+0x92>
    104e:	+--|-------- bra.s 1026 <memmove+0x7e>
    1050:	|  \-------> movea.l d0,a1
    1052:	|            add.l d2,d1
			*d++ = *s++;
    1054:	|        /-> move.b -1(a2),(a1)+
		while (len--)
    1058:	|        |   cmp.l a2,d1
    105a:	\--------|-- beq.s 1026 <memmove+0x7e>
    105c:	         |   addq.l #1,a2
    105e:	         \-- bra.s 1054 <memmove+0xac>

00001060 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    1060:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1064:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1068:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    106c:	mulu.w 8(sp),d1
	addw	d1, d0
    1070:	add.w d1,d0
	swap	d0
    1072:	swap d0
	clrw	d0
    1074:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1076:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    107a:	mulu.w 10(sp),d1
	addl	d1, d0
    107e:	add.l d1,d0
	rts
    1080:	rts

00001082 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    1082:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    1084:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1088:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    108c:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1092:	   /-- bcc.s 10aa <__udivsi3+0x28>
	movel	d0, d2
    1094:	   |   move.l d0,d2
	clrw	d2
    1096:	   |   clr.w d2
	swap	d2
    1098:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    109a:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    109c:	   |   move.w d2,d0
	swap	d0
    109e:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    10a0:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    10a4:	   |   divu.w d1,d2
	movew	d2, d0
    10a6:	   |   move.w d2,d0
	jra	6f
    10a8:	/--|-- bra.s 10da <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    10aa:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    10ac:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    10ae:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    10b0:	|  |   cmpi.l #65536,d1
	jcc	4b
    10b6:	|  \-- bcc.s 10ac <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    10b8:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    10ba:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    10c0:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    10c2:	|      mulu.w d0,d1
	swap	d2
    10c4:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    10c6:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    10c8:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    10ca:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    10cc:	|  /-- bne.s 10d8 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    10ce:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    10d0:	|  +-- bcs.s 10d8 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    10d2:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    10d6:	+--|-- bls.s 10da <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    10d8:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    10da:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    10dc:	       rts

000010de <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    10de:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    10e0:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    10e2:	    move.l 12(sp),d1
	jpl	1f
    10e6:	/-- bpl.s 10ec <__divsi3+0xe>
	negl	d1
    10e8:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    10ea:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    10ec:	\-> move.l 8(sp),d0
	jpl	2f
    10f0:	/-- bpl.s 10f6 <__divsi3+0x18>
	negl	d0
    10f2:	|   neg.l d0
	negb	d2
    10f4:	|   neg.b d2

2:	movel	d1, sp@-
    10f6:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    10f8:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    10fa:	    bsr.s 1082 <__udivsi3>
	addql	#8, sp
    10fc:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    10fe:	    tst.b d2
	jpl	3f
    1100:	/-- bpl.s 1104 <__divsi3+0x26>
	negl	d0
    1102:	|   neg.l d0

3:	movel	sp@+, d2
    1104:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    1106:	    rts

00001108 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1108:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    110c:	move.l 4(sp),d0
	movel	d1, sp@-
    1110:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1112:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    1114:	bsr.s 10de <__divsi3>
	addql	#8, sp
    1116:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1118:	move.l 8(sp),d1
	movel	d1, sp@-
    111c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    111e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    1120:	bsr.w 1060 <__mulsi3>
	addql	#8, sp
    1124:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1126:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    112a:	sub.l d0,d1
	movel	d1, d0
    112c:	move.l d1,d0
	rts
    112e:	rts

00001130 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1130:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1134:	move.l 4(sp),d0
	movel	d1, sp@-
    1138:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    113a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    113c:	bsr.w 1082 <__udivsi3>
	addql	#8, sp
    1140:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1142:	move.l 8(sp),d1
	movel	d1, sp@-
    1146:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1148:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    114a:	bsr.w 1060 <__mulsi3>
	addql	#8, sp
    114e:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1150:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1154:	sub.l d0,d1
	movel	d1, d0
    1156:	move.l d1,d0
	rts
    1158:	rts

0000115a <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    115a:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    115c:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1160:	jsr -516(a6)
    move.l (sp)+, a6
    1164:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    1166:	rts

00001168 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    1168:	move.b d0,(a3)+
	rts
    116a:	rts

0000116c <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    116c:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    116e:	                         adda.l a0,a2
	move.l	a2,a3
    1170:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    1172:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    1174:	                         moveq #56,d4
	moveq	#8,d5
    1176:	                         moveq #8,d5
	bra.s	.Lliteral
    1178:	   /-------------------- bra.s 11e2 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    117a:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    117c:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    117e:	+--|-------------------- dbf d1,117a <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    1182:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    1184:	|  |     /-------------- bcc.s 1188 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    1186:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    1188:	|  |  |  >-------------> tst.w d0
    118a:	|  |  |  |           /-- bne.s 1194 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    118c:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    118e:	|  |  |  |           |   bls.s 1206 <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    1190:	|  |  |  |           |   move.w (a0)+,d0
    1192:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    1194:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    1196:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    1198:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    119a:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    119c:	|  |  |  |               movem.w (1200 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    11a2:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    11a4:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    11a6:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    11a8:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    11aa:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    11ac:	|  |  |  |               tst.w d0
    11ae:	|  |  |  |           /-- bne.s 11b4 <_doynaxdepack_asm+0x48>
    11b0:	|  |  |  |           |   move.w (a0)+,d0
    11b2:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    11b4:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    11b6:	|  |  |  |  /----------- beq.s 11ce <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    11b8:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    11ba:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    11bc:	|  |  |  |  |  /-------- bpl.s 11ca <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    11be:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    11c0:	|  |  |  |  |  |  /----- bpl.s 11c8 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    11c2:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    11c4:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    11c6:	|  |  |  |  |  |  |  \-- bmi.s 11c2 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    11c8:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    11ca:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    11cc:	|  |  |  |  |        /-- bcc.s 11d0 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    11ce:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    11d0:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    11d2:	|  |  |  |  \----------- dbf d1,11ce <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    11d6:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    11d8:	|  |  |  \-------------- bcc.s 1188 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    11da:	|  |  |                  tst.w d0
    11dc:	|  +--|----------------- bne.s 11e2 <_doynaxdepack_asm+0x76>
    11de:	|  |  |                  move.w (a0)+,d0
    11e0:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    11e2:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    11e4:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    11e6:	|     \----------------- bcc.s 1186 <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    11e8:	|                 /----- bpl.s 11f0 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    11ea:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    11ec:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    11ee:	|                 |  \-- bmi.s 11ea <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    11f0:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    11f2:	\--------------------/-X dbv.s d1,117a <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    11f6:	                     |   add.l d0,d0
	eor.w	d1,d0		
    11f8:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    11fa:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    11fc:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    11fe:	                     \-- bra.s 11f2 <_doynaxdepack_asm+0x86>

00001200 <doy_table>:
    1200:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    1210:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    1220:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    1230:	.............o
