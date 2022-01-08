
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
      4e:	                                                                            lea -20(sp),sp
      52:	                                                                            movem.l d2-d7/a2-a6,-(sp)
    SysBase = *((struct ExecBase**)4UL);
      56:	                                                                            movea.l 4 <_start+0x4>,a6
      5a:	                                                                            move.l a6,fe90 <SysBase>
    
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      60:	                                                                            lea 12a5 <incbin_tilescolors_end+0x4b>,a1
      66:	                                                                            moveq #0,d0
      68:	                                                                            jsr -552(a6)
      6c:	                                                                            move.l d0,fe8c <DOSBase>
	if (!DOSBase)
      72:	      /-------------------------------------------------------------------- beq.w 638 <main+0x5ea>
		Exit(0);
	IntuitionBase = (struct IntuitionBase *)OpenLibrary((CONST_STRPTR)"intuition.library",0);
      76:	      |                                                                     movea.l fe90 <SysBase>,a6
      7c:	      |                                                                     lea 12b1 <incbin_tilescolors_end+0x57>,a1
      82:	      |                                                                     moveq #0,d0
      84:	      |                                                                     jsr -552(a6)
	if (!IntuitionBase)
      88:	      |                                                                     tst.l d0
      8a:	/-----|-------------------------------------------------------------------- beq.w 60e <main+0x5c0>
		Exit(0);

	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      8e:	|  /--|-------------------------------------------------------------------> movea.l fe90 <SysBase>,a6
      94:	|  |  |                                                                     lea 12c3 <incbin_tilescolors_end+0x69>,a1
      9a:	|  |  |                                                                     moveq #0,d0
      9c:	|  |  |                                                                     jsr -552(a6)
      a0:	|  |  |                                                                     move.l d0,fe88 <GfxBase>
	if (!GfxBase)
      a6:	|  |  |  /----------------------------------------------------------------- beq.w 5fe <main+0x5b0>
		Exit(0);
    KPrintF("Started!\n");
      aa:	|  |  |  |  /-------------------------------------------------------------> pea 12d4 <incbin_tilescolors_end+0x7a>
      b0:	|  |  |  |  |                                                               lea 830 <KPrintF>,a4
      b6:	|  |  |  |  |                                                               jsr (a4)
            KPrintF("Application created!\n");
      b8:	|  |  |  |  |                                                               pea 12de <incbin_tilescolors_end+0x84>
      be:	|  |  |  |  |                                                               jsr (a4)
            SetTaskPri(FindTask(NULL), TASK_PRIORITY); // setting task priority >20, greater then all OS function, allows us to us OS even when progamming the hardware
      c0:	|  |  |  |  |                                                               movea.l fe90 <SysBase>,a6
      c6:	|  |  |  |  |                                                               suba.l a1,a1
      c8:	|  |  |  |  |                                                               jsr -294(a6)
      cc:	|  |  |  |  |                                                               movea.l fe90 <SysBase>,a6
      d2:	|  |  |  |  |                                                               movea.l d0,a1
      d4:	|  |  |  |  |                                                               moveq #20,d0
      d6:	|  |  |  |  |                                                               jsr -300(a6)
    KPrintF("Operator new Called");
      da:	|  |  |  |  |                                                               pea 1286 <incbin_tilescolors_end+0x2c>
      e0:	|  |  |  |  |                                                               jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
      e2:	|  |  |  |  |                                                               movea.l fe90 <SysBase>,a6
      e8:	|  |  |  |  |                                                               moveq #8,d0
      ea:	|  |  |  |  |                                                               moveq #0,d1
      ec:	|  |  |  |  |                                                               jsr -198(a6)
      f0:	|  |  |  |  |                                                               movea.l d0,a5

#include "ColorPalette.h"

ColorPalette::ColorPalette(int colorCount, USHORT* palette) {
    colors=palette;
      f2:	|  |  |  |  |                                                               move.l #4568,(a5)
    numberOfColors=colorCount;
      f8:	|  |  |  |  |                                                               moveq #32,d0
      fa:	|  |  |  |  |                                                               move.l d0,4(a5)
    KPrintF("Operator new Called");
      fe:	|  |  |  |  |                                                               pea 1286 <incbin_tilescolors_end+0x2c>
     104:	|  |  |  |  |                                                               jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     106:	|  |  |  |  |                                                               movea.l fe90 <SysBase>,a6
     10c:	|  |  |  |  |                                                               moveq #8,d0
     10e:	|  |  |  |  |                                                               moveq #0,d1
     110:	|  |  |  |  |                                                               jsr -198(a6)
     114:	|  |  |  |  |                                                               movea.l d0,a3
    colors=palette;
     116:	|  |  |  |  |                                                               move.l #4634,(a3)
    numberOfColors=colorCount;
     11c:	|  |  |  |  |                                                               moveq #32,d3
     11e:	|  |  |  |  |                                                               move.l d3,4(a3)
    KPrintF("Operator new Called");
     122:	|  |  |  |  |                                                               pea 1286 <incbin_tilescolors_end+0x2c>
     128:	|  |  |  |  |                                                               jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     12a:	|  |  |  |  |                                                               movea.l fe90 <SysBase>,a6
     130:	|  |  |  |  |                                                               moveq #56,d0
     132:	|  |  |  |  |                                                               moveq #0,d1
     134:	|  |  |  |  |                                                               jsr -198(a6)
     138:	|  |  |  |  |                                                               movea.l d0,a2

    Display::Display(UWORD mode) {
        init(mode,false);
    }

    Display::Display(UWORD mode,bool interleaved) {
     13a:	|  |  |  |  |                                                               clr.b 54(a2)
        init(mode,interleaved);
     13e:	|  |  |  |  |                                                               pea 1 <_start+0x1>
     142:	|  |  |  |  |                                                               pea 5000 <incbin_image_start+0x3000>
     146:	|  |  |  |  |                                                               move.l d0,-(sp)
     148:	|  |  |  |  |                                                               move.l #1936,d2
     14e:	|  |  |  |  |                                                               movea.l d2,a0
     150:	|  |  |  |  |                                                               jsr (a0)
       //     ->backgroundColor(0x00f);
            return cl;
    }

    void Display::setBackgroundImage(UBYTE* image) {
        int bitplanesize=widthInBytes*height;
     152:	|  |  |  |  |                                                               move.l 46(a2),d3
     156:	|  |  |  |  |                                                               move.l #4088,d4
     15c:	|  |  |  |  |                                                               move.l 42(a2),-(sp)
     160:	|  |  |  |  |                                                               move.l d3,-(sp)
     162:	|  |  |  |  |                                                               movea.l d4,a0
     164:	|  |  |  |  |                                                               jsr (a0)
        for (int i=0;i<numberOfBitplanes;i++) {
     166:	|  |  |  |  |                                                               move.l 50(a2),d1
     16a:	|  |  |  |  |                                                               lea 40(sp),sp
     16e:	|  |  |  |  |  /----------------------------------------------------------- ble.s 1c8 <main+0x17a>
     170:	|  |  |  |  |  |                                                            tst.b 54(a2)
     174:	|  |  |  |  |  |     /----------------------------------------------------- bne.w 562 <main+0x514>
            if (!interleaved) {
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     178:	|  |  |  |  |  |     |                                                      move.l #8192,(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     17e:	|  |  |  |  |  |     |                                                      moveq #1,d3
     180:	|  |  |  |  |  |     |                                                      cmp.l d1,d3
     182:	|  |  |  |  |  +-----|----------------------------------------------------- beq.s 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     184:	|  |  |  |  |  |     |                                                      move.l d0,d5
     186:	|  |  |  |  |  |     |                                                      addi.l #8192,d5
     18c:	|  |  |  |  |  |     |                                                      move.l d5,4(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     190:	|  |  |  |  |  |     |                                                      moveq #2,d3
     192:	|  |  |  |  |  |     |                                                      cmp.l d1,d3
     194:	|  |  |  |  |  +-----|----------------------------------------------------- beq.s 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     196:	|  |  |  |  |  |     |                                                      move.l d0,d3
     198:	|  |  |  |  |  |     |                                                      add.l d0,d3
     19a:	|  |  |  |  |  |     |                                                      move.l d3,d5
     19c:	|  |  |  |  |  |     |                                                      addi.l #8192,d5
     1a2:	|  |  |  |  |  |     |                                                      move.l d5,8(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     1a6:	|  |  |  |  |  |     |                                                      moveq #3,d5
     1a8:	|  |  |  |  |  |     |                                                      cmp.l d1,d5
     1aa:	|  |  |  |  |  +-----|----------------------------------------------------- beq.s 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     1ac:	|  |  |  |  |  |     |                                                      add.l d3,d0
     1ae:	|  |  |  |  |  |     |                                                      addi.l #8192,d0
     1b4:	|  |  |  |  |  |     |                                                      move.l d0,12(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     1b8:	|  |  |  |  |  |     |                                                      subq.l #4,d1
     1ba:	|  |  |  |  |  +-----|----------------------------------------------------- beq.s 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     1bc:	|  |  |  |  |  |     |                                                      add.l d3,d3
     1be:	|  |  |  |  |  |     |                                                      addi.l #8192,d3
     1c4:	|  |  |  |  |  |     |                                                      move.l d3,16(a2)
            }
        }
    }

    void Display::setColorPalette(ColorPalette* palette) {
        colorPalette=palette;
     1c8:	|  |  |  |  |  >-----|----------------------------------------------------> move.l a5,22(a2)
    KPrintF("Operator new Called");
     1cc:	|  |  |  |  |  |     |                                                      pea 1286 <incbin_tilescolors_end+0x2c>
     1d2:	|  |  |  |  |  |     |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     1d4:	|  |  |  |  |  |     |                                                      movea.l fe90 <SysBase>,a6
     1da:	|  |  |  |  |  |     |                                                      moveq #56,d0
     1dc:	|  |  |  |  |  |     |                                                      moveq #0,d1
     1de:	|  |  |  |  |  |     |                                                      jsr -198(a6)
     1e2:	|  |  |  |  |  |     |                                                      movea.l d0,a5
    Display::Display(UWORD mode,bool interleaved) {
     1e4:	|  |  |  |  |  |     |                                                      clr.b 54(a5)
        init(mode,interleaved);
     1e8:	|  |  |  |  |  |     |                                                      pea 1 <_start+0x1>
     1ec:	|  |  |  |  |  |     |                                                      pea 5000 <incbin_image_start+0x3000>
     1f0:	|  |  |  |  |  |     |                                                      move.l d0,-(sp)
     1f2:	|  |  |  |  |  |     |                                                      movea.l d2,a0
     1f4:	|  |  |  |  |  |     |                                                      jsr (a0)
        colorPalette=palette;
     1f6:	|  |  |  |  |  |     |                                                      move.l a3,22(a5)
    startScreen->setColorPalette(palette);

    Display* gameScreen=new Display(LORES_KEY|DEPTH_32_COLORS,true);
    gameScreen->setColorPalette(tilespalette);

    startScreen->show();
     1fa:	|  |  |  |  |  |     |                                                      move.l a2,-(sp)
     1fc:	|  |  |  |  |  |     |                                                      lea 9ba <_ZN7Display4showEv>,a2
     202:	|  |  |  |  |  |     |                                                      jsr (a2)
     204:	|  |  |  |  |  |     |                                                      lea 20(sp),sp
    volatile UBYTE *ciaa_pra = (volatile UBYTE *) 0xbfe001;
    #define PRA_FIR0_BIT (1 << 6) 

    public:
        void waitLMB() {
            while ((*ciaa_pra & PRA_FIR0_BIT)!=0);
     208:	|  |  |  |  |  |  /--|----------------------------------------------------> move.b bfe001 <gcc8_c_support.c.915a8519+0xbeb765>,d0
     20e:	|  |  |  |  |  |  |  |                                                      btst #6,d0
     212:	|  |  |  |  |  |  +--|----------------------------------------------------- bne.s 208 <main+0x1ba>

    mouse.waitLMB();

    gameScreen->show();
     214:	|  |  |  |  |  |  |  |                                                      move.l a5,-(sp)
     216:	|  |  |  |  |  |  |  |                                                      jsr (a2)
    KPrintF("Operator new Called");
     218:	|  |  |  |  |  |  |  |                                                      pea 1286 <incbin_tilescolors_end+0x2c>
     21e:	|  |  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     220:	|  |  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     226:	|  |  |  |  |  |  |  |                                                      moveq #16,d0
     228:	|  |  |  |  |  |  |  |                                                      moveq #0,d1
     22a:	|  |  |  |  |  |  |  |                                                      jsr -198(a6)
     22e:	|  |  |  |  |  |  |  |                                                      move.l d0,d2
#include "../support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/graphics.h>
#include "Blitter.h"

Blitable::Blitable() {
     230:	|  |  |  |  |  |  |  |                                                      movea.l d0,a0
     232:	|  |  |  |  |  |  |  |                                                      clr.l 4(a0)
     236:	|  |  |  |  |  |  |  |                                                      clr.l 8(a0)
    custom = (struct Custom*)0xdff000;
     23a:	|  |  |  |  |  |  |  |                                                      move.l #14675968,12(a0)
class TestBlitable : public Blitable {
     242:	|  |  |  |  |  |  |  |                                                      move.l #4932,(a0)
    KPrintF("Operator new Called");
     248:	|  |  |  |  |  |  |  |                                                      pea 1286 <incbin_tilescolors_end+0x2c>
     24e:	|  |  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     250:	|  |  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     256:	|  |  |  |  |  |  |  |                                                      moveq #16,d0
     258:	|  |  |  |  |  |  |  |                                                      moveq #0,d1
     25a:	|  |  |  |  |  |  |  |                                                      jsr -198(a6)
     25e:	|  |  |  |  |  |  |  |                                                      movea.l d0,a3
Blitable::Blitable() {
     260:	|  |  |  |  |  |  |  |                                                      clr.l 4(a3)
     264:	|  |  |  |  |  |  |  |                                                      clr.l 8(a3)
    custom = (struct Custom*)0xdff000;
     268:	|  |  |  |  |  |  |  |                                                      move.l #14675968,12(a3)
class TestBlitable : public Blitable {
     270:	|  |  |  |  |  |  |  |                                                      move.l #4932,(a3)
    KPrintF("Operator new Called");
     276:	|  |  |  |  |  |  |  |                                                      pea 1286 <incbin_tilescolors_end+0x2c>
     27c:	|  |  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     27e:	|  |  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     284:	|  |  |  |  |  |  |  |                                                      moveq #16,d0
     286:	|  |  |  |  |  |  |  |                                                      moveq #0,d1
     288:	|  |  |  |  |  |  |  |                                                      jsr -198(a6)
     28c:	|  |  |  |  |  |  |  |                                                      movea.l d0,a0
Blitable::Blitable() {
     28e:	|  |  |  |  |  |  |  |                                                      clr.l 4(a0)
     292:	|  |  |  |  |  |  |  |                                                      clr.l 8(a0)
    custom = (struct Custom*)0xdff000;
     296:	|  |  |  |  |  |  |  |                                                      move.l #14675968,12(a0)
class CookieCutBlitTest : public Blitable {
     29e:	|  |  |  |  |  |  |  |                                                      move.l #4920,(a0)
    KPrintF("Operator new Called");
     2a4:	|  |  |  |  |  |  |  |                                                      pea 1286 <incbin_tilescolors_end+0x2c>
     2aa:	|  |  |  |  |  |  |  |                                                      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     2ac:	|  |  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     2b2:	|  |  |  |  |  |  |  |                                                      moveq #20,d0
     2b4:	|  |  |  |  |  |  |  |                                                      moveq #0,d1
     2b6:	|  |  |  |  |  |  |  |                                                      jsr -198(a6)
     2ba:	|  |  |  |  |  |  |  |                                                      movea.l d0,a2
Blitable::Blitable() {
     2bc:	|  |  |  |  |  |  |  |                                                      clr.l 4(a2)
     2c0:	|  |  |  |  |  |  |  |                                                      clr.l 8(a2)
    custom = (struct Custom*)0xdff000;
     2c4:	|  |  |  |  |  |  |  |                                                      move.l #14675968,12(a2)
        ClearDisplayJob(Display* screen) {
     2cc:	|  |  |  |  |  |  |  |                                                      move.l #4908,(a2)
            this->display=screen;
     2d2:	|  |  |  |  |  |  |  |                                                      move.l a5,16(a2)
INCBIN_CHIP(tiles, "tiles.BPL") // load image into chipmem so we can use it without copying

Tilemap::Tilemap( int width, int height) {
    this->width=width;
    this->height=height;
    mapdata=(UBYTE *)AllocMem( width*height, MEMF_ANY);
     2d6:	|  |  |  |  |  |  |  |                                                      movea.l fe90 <SysBase>,a6
     2dc:	|  |  |  |  |  |  |  |                                                      move.l #10000,d0
     2e2:	|  |  |  |  |  |  |  |                                                      moveq #0,d1
     2e4:	|  |  |  |  |  |  |  |                                                      jsr -198(a6)
    for (int i=0;i<width*height;i++) {
        *(mapdata+i)=0;
     2e8:	|  |  |  |  |  |  |  |                                                      pea 2710 <incbin_image_start+0x710>
     2ec:	|  |  |  |  |  |  |  |                                                      clr.l -(sp)
     2ee:	|  |  |  |  |  |  |  |                                                      move.l d0,-(sp)
     2f0:	|  |  |  |  |  |  |  |                                                      jsr de6 <memset>
CookieCutBlitTest* c=new CookieCutBlitTest();
ClearDisplayJob* d=new ClearDisplayJob(gameScreen);

    Tilemap tilemap(100,100);

    BlitterControl::instance()->schedule(a);
     2f6:	|  |  |  |  |  |  |  |                                                      lea 32(sp),sp
     2fa:	|  |  |  |  |  |  |  |                                                      move.l #2400,d3
     300:	|  |  |  |  |  |  |  |                                                      movea.l d3,a0
     302:	|  |  |  |  |  |  |  |                                                      jsr (a0)
     304:	|  |  |  |  |  |  |  |                                                      move.l d2,-(sp)
     306:	|  |  |  |  |  |  |  |                                                      move.l d0,-(sp)
     308:	|  |  |  |  |  |  |  |                                                      lea 71c <_ZN14BlitterControl8scheduleEP8Blitable>,a6
     30e:	|  |  |  |  |  |  |  |                                                      jsr (a6)
    BlitterControl::instance()->schedule(b);
     310:	|  |  |  |  |  |  |  |                                                      movea.l d3,a0
     312:	|  |  |  |  |  |  |  |                                                      jsr (a0)
     314:	|  |  |  |  |  |  |  |                                                      move.l a3,-(sp)
     316:	|  |  |  |  |  |  |  |                                                      move.l d0,-(sp)
     318:	|  |  |  |  |  |  |  |                                                      jsr (a6)
    BlitterControl::instance()->schedule(d);
     31a:	|  |  |  |  |  |  |  |                                                      movea.l d3,a0
     31c:	|  |  |  |  |  |  |  |                                                      jsr (a0)
     31e:	|  |  |  |  |  |  |  |                                                      move.l a2,-(sp)
     320:	|  |  |  |  |  |  |  |                                                      move.l d0,-(sp)
     322:	|  |  |  |  |  |  |  |                                                      jsr (a6)
    }
}


 void Tilemap::drawToScreen(Display* display) {
    visibleWidth=display->widthInBytes/tileWidthInBytes;
     324:	|  |  |  |  |  |  |  |                                                      move.l 46(a5),d3
     328:	|  |  |  |  |  |  |  |                                                      move.l d3,d6
     32a:	|  |  |  |  |  |  |  |                                                      lea 24(sp),sp
     32e:	|  |  |  |  |  |  |  |                       /----------------------------- bmi.w 552 <main+0x504>
     332:	|  |  |  |  |  |  |  |                       |                              asr.l #2,d6
    visibleHeight=display->height/tileHeight;
     334:	|  |  |  |  |  |  |  |                       |                              move.l 42(a5),d2
     338:	|  |  |  |  |  |  |  |                       |                              move.l d2,d0
     33a:	|  |  |  |  |  |  |  |                    /--|----------------------------- bmi.w 54a <main+0x4fc>
     33e:	|  |  |  |  |  |  |  |                    |  |  /-------------------------> asr.l #5,d0
     340:	|  |  |  |  |  |  |  |                    |  |  |                           move.l d0,52(sp)
    int numberOfTiles=visibleWidth*visibleHeight;
     344:	|  |  |  |  |  |  |  |                    |  |  |                           move.l d0,-(sp)
     346:	|  |  |  |  |  |  |  |                    |  |  |                           move.l d6,-(sp)
     348:	|  |  |  |  |  |  |  |                    |  |  |                           movea.l d4,a0
     34a:	|  |  |  |  |  |  |  |                    |  |  |                           jsr (a0)
     34c:	|  |  |  |  |  |  |  |                    |  |  |                           addq.l #8,sp
    if (tiles==NULL) {
        tiles=new Tile*[numberOfTiles];
     34e:	|  |  |  |  |  |  |  |                    |  |  |                           cmpi.l #536870911,d0
     354:	|  |  |  |  |  |  |  |                    |  |  |        /----------------- bhi.w 4f4 <main+0x4a6>
     358:	|  |  |  |  |  |  |  |                    |  |  |        |                  add.l d0,d0
     35a:	|  |  |  |  |  |  |  |                    |  |  |        |                  move.l d0,d5
     35c:	|  |  |  |  |  |  |  |                    |  |  |        |                  add.l d0,d5
    KPrintF("Operator new[] Called");
     35e:	|  |  |  |  |  |  |  |                    |  |  |        |  /-------------> pea 12f4 <incbin_tilescolors_end+0x9a>
     364:	|  |  |  |  |  |  |  |                    |  |  |        |  |               jsr (a4)
    KPrintF("Operator new Called");
     366:	|  |  |  |  |  |  |  |                    |  |  |        |  |               pea 1286 <incbin_tilescolors_end+0x2c>
     36c:	|  |  |  |  |  |  |  |                    |  |  |        |  |               jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     36e:	|  |  |  |  |  |  |  |                    |  |  |        |  |               movea.l fe90 <SysBase>,a6
     374:	|  |  |  |  |  |  |  |                    |  |  |        |  |               move.l d5,d0
     376:	|  |  |  |  |  |  |  |                    |  |  |        |  |               moveq #0,d1
     378:	|  |  |  |  |  |  |  |                    |  |  |        |  |               jsr -198(a6)
     37c:	|  |  |  |  |  |  |  |                    |  |  |        |  |               move.l d0,64(sp)
        for (int y=0;y<visibleHeight;y++) {
     380:	|  |  |  |  |  |  |  |                    |  |  |        |  |               addq.l #8,sp
     382:	|  |  |  |  |  |  |  |                    |  |  |        |  |               moveq #31,d0
     384:	|  |  |  |  |  |  |  |                    |  |  |        |  |               cmp.l d2,d0
     386:	|  |  |  |  |  |  |  |  /-----------------|--|--|--------|--|-------------- bge.w 702 <main+0x6b4>
     38a:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               moveq #3,d5
     38c:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               cmp.l d3,d5
     38e:	|  |  |  |  |  |  |  |  +-----------------|--|--|--------|--|-------------- bge.w 702 <main+0x6b4>
     392:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l d6,d0
     394:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               neg.l d0
     396:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               add.l d0,d0
     398:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               add.l d0,d0
     39a:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l d0,60(sp)
     39e:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l 56(sp),d0
     3a2:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               neg.l d0
     3a4:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               clr.l 48(sp)
     3a8:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               moveq #0,d3
     3aa:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l #65160,d5
     3b0:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l d5,44(sp)
     3b4:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |               move.l d0,d5
            for (int x=0;x<visibleWidth;x++) {
     3b6:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  /----------> movea.l 48(sp),a3
     3ba:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            adda.l a3,a3
     3bc:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            adda.l a3,a3
     3be:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            adda.l 56(sp),a3
     3c2:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            moveq #0,d2
     3c4:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            move.l d5,d7
     3c6:	|  |  |  |  |  |  |  |  |                 |  |  |        |  |  |            subq.l #4,d7
    KPrintF("Operator new Called");
     3c8:	|  |  |  |  |  |  |  |  |  /--------------|--|--|--------|--|--|----------> pea 1286 <incbin_tilescolors_end+0x2c>
     3ce:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     3d0:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            movea.l fe90 <SysBase>,a6
     3d6:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            moveq #54,d0
     3d8:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            moveq #0,d1
     3da:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            jsr -198(a6)
     3de:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            movea.l d0,a6
Blitable::Blitable() {
     3e0:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            clr.l 4(a6)
     3e4:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            clr.l 8(a6)
    custom = (struct Custom*)0xdff000;
     3e8:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l #14675968,12(a6)


 }


Tile::Tile() {
     3f0:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l #4896,(a6)
     3f6:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.w #32,20(a6)
     3fc:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.w #32,22(a6)
     402:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.w #4,24(a6)
     408:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.w #2,26(a6)
     40e:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.w #2,28(a6)
                tiles[visibleWidth*y+x]=new Tile();
     414:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d0,(a3)+
Tile::~Tile() {
}


void Tile::init(Display *screen,int xPosGrid,int yPosGrid,int tile) {
            this->display=screen;
     416:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l a5,16(a6)
            
            this->yPosGrid=yPosGrid;
     41a:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d3,34(a6)
            this->xPosGrid=xPosGrid;
     41e:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d2,30(a6)
            this->xPosOffset=xPosGrid*tileWidthInBytes;
     422:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            lea (0,a3,d7.l),a0
     426:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l a0,38(a6)

            this->yPosOffset=(yPosGrid*tileHeight)*display->widthInBytes*display->numberOfBitplanes ;
     42a:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l 46(a5),-(sp)
     42e:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d3,-(sp)
     430:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            movea.l d4,a0
     432:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            jsr (a0)
     434:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            addq.l #4,sp
     436:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l 50(a5),(sp)
     43a:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d0,-(sp)
     43c:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            movea.l d4,a0
     43e:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            jsr (a0)
     440:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            lsl.l #5,d0
     442:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l d0,42(a6)

            this->tile=tile;
     446:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            clr.l 46(a6)
            this->tilePointer=(UBYTE *)tiles+tile*tileWidthInBytes*tileHeight*display->numberOfBitplanes;
     44a:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            move.l #63236,50(a6)
}

BlitterControl* BlitterControl::instance(){
    if (BlitterControl::singleton==NULL) {
     452:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     458:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            lea 12(sp),sp
     45c:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |            cmpa.w #0,a2
     460:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |     /----- beq.w 4fa <main+0x4ac>
    custom = (struct Custom*)0xdff000;
    DisownBlitter();
}

bool BlitterControl::isScheduled(Blitable *blit) {
    if (blit->prev!=NULL || currentBlit==blit) {
     464:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |  /--|----> cmpa.l (a2),a6
     466:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |  |  |  /-- beq.s 480 <main+0x432>
        KPrintF("blitter busy\n");
    }
}

bool BlitterControl::hasMoreScheduled() {
    if (lastScheduledBlitable==NULL) {
     468:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |  |  |  |   movea.l 4(a2),a0
     46c:	|  |  |  |  |  |  |  |  |  |              |  |  |        |  |  |  |  |  |   cmpa.w #0,a0
     470:	|  |  |  |  |  |  |  |  |  |     /--------|--|--|--------|--|--|--|--|--|-- beq.w 6e6 <main+0x698>
            blit->prev=lastScheduledBlitable;
     474:	|  |  |  |  |  |  |  |  |  |     |        |  |  |        |  |  |  |  |  |   move.l a0,8(a6)
            lastScheduledBlitable->next=blit;
     478:	|  |  |  |  |  |  |  |  |  |     |        |  |  |        |  |  |  |  |  |   move.l a6,4(a0)
            lastScheduledBlitable=blit;
     47c:	|  |  |  |  |  |  |  |  |  |     |        |  |  |        |  |  |  |  |  |   move.l a6,4(a2)
            for (int x=0;x<visibleWidth;x++) {
     480:	|  |  |  |  |  |  |  |  |  |     |        |  |  |        |  |  |  |  |  \-> addq.l #1,d2
     482:	|  |  |  |  |  |  |  |  |  |     |        |  |  |        |  |  |  |  |      cmp.l d6,d2
     484:	|  |  |  |  |  |  |  |  |  +-----|--------|--|--|--------|--|--|--|--|----- blt.w 3c8 <main+0x37a>
        for (int y=0;y<visibleHeight;y++) {
     488:	|  |  |  |  |  |  |  |  |  |  /--|--------|--|--|--------|--|--|--|--|----> addq.l #1,d3
     48a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |        |  |  |  |  |      add.l d6,48(sp)
     48e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |        |  |  |  |  |      add.l 60(sp),d5
     492:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |        |  |  |  |  |      cmp.l 52(sp),d3
     496:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |        |  |  \--|--|----- blt.w 3b6 <main+0x368>
     49a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |        |  |     |  |      movea.l 44(sp),a3
    if (BlitterControl::singleton==NULL) {
     49e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  /-----|--|-----|--|----> movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     4a4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |     |  |     |  |      cmpa.w #0,a2
     4a8:	|  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|-----|--|-----|--|----- beq.w 65a <main+0x60c>
    }
}

bool BlitterControl::isBlittingInProgress() {
    // readtwice cause of agnus bug on older machines
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     4ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----|--|-----|--|----> movea.l 8(a2),a0
     4b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |     |  |      move.w 2(a0),d0
     4b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |     |  |      move.w 2(a0),d1
     4b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |     |  |      or.w d1,d0
    if (!isBlittingInProgress() && hasMoreScheduled() ) {
     4ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |     |  |      btst #14,d0
     4be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  /--|--|----- bne.w 6a4 <main+0x656>
    if (lastScheduledBlitable==NULL) {
     4c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /-> tst.l 4(a2)
     4c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|-- beq.w 6a4 <main+0x656>
}

void BlitterControl::startNextBlit() {
    currentBlit=currentBlit->next;
     4ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |   movea.l (a2),a0
     4cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |   movea.l 4(a0),a0
     4d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |   move.l a0,(a2)
    if (currentBlit!=NULL) {
     4d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|-- beq.w 6d0 <main+0x682>
        currentBlit->prev=NULL;
     4d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   clr.l 8(a0)
        currentBlit->blit();
     4da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l (a0),a1
     4dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
     4de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l (a1),a0
     4e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a0)
     4e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,sp
    if (BlitterControl::singleton==NULL) {
     4e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     4ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmpa.w #0,a2
     4ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-- bne.s 4ac <main+0x45e>
     4f0:	|  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|-- bra.w 65a <main+0x60c>
        tiles=new Tile*[numberOfTiles];
     4f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> moveq #-1,d5
     4f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \--|--|--|--|-- bra.w 35e <main+0x310>
    KPrintF("Operator new Called");
     4fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  \--|-> pea 1286 <incbin_tilescolors_end+0x2c>
     500:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     502:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l fe90 <SysBase>,a6
     508:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   moveq #12,d0
     50a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   moveq #0,d1
     50c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr -198(a6)
     510:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l d0,a2
BlitterControl::BlitterControl() {
     512:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   clr.l (a2)
     514:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     518:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   move.l #14675968,8(a2)
    OwnBlitter();
     520:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l 48(sp),a0
     524:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l (a0),a6
     526:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     52a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   move.l a2,fe98 <_ZN14BlitterControl9singletonE>
                BlitterControl::instance()->schedule(tiles[visibleWidth*y+x]);
     530:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   movea.l -4(a3),a6
    if (blit->prev!=NULL || currentBlit==blit) {
     534:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   addq.l #4,sp
     536:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   tst.l 8(a6)
     53a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  \-----|-- beq.w 464 <main+0x416>
            for (int x=0;x<visibleWidth;x++) {
     53e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   addq.l #1,d2
     540:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   cmp.l d6,d2
     542:	|  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--------|--------|-- blt.w 3c8 <main+0x37a>
     546:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--------|--------|-- bra.w 488 <main+0x43a>
    visibleHeight=display->height/tileHeight;
     54a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--------|--------|-> moveq #31,d0
     54c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |        |   add.l d2,d0
     54e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--------|--------|-- bra.w 33e <main+0x2f0>
    visibleWidth=display->widthInBytes/tileWidthInBytes;
     552:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------|--------|-> addq.l #3,d6
     554:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |        |        |   asr.l #2,d6
    visibleHeight=display->height/tileHeight;
     556:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |        |        |   move.l 42(a5),d2
     55a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |        |        |   move.l d2,d0
     55c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \--|--|--------|--------|-- bpl.w 33e <main+0x2f0>
     560:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--------|--------|-- bra.s 54a <main+0x4fc>
                bitplanes[i]=(UBYTE*)(image + bitplanesize * i);
     562:	|  |  |  |  |  |  |  \--|--|--|--|--|--|-----------|--|--------|--------|-> move.l #8192,(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     568:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   moveq #1,d5
     56a:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   cmp.l d1,d5
     56c:	|  |  |  |  |  +--|-----|--|--|--|--|--|-----------|--|--------|--------|-- beq.w 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + (widthInBytes * i));
     570:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d3,d0
     572:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   addi.l #8192,d0
     578:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d0,4(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     57c:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   moveq #2,d5
     57e:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   cmp.l d1,d5
     580:	|  |  |  |  |  +--|-----|--|--|--|--|--|-----------|--|--------|--------|-- beq.w 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + (widthInBytes * i));
     584:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d3,d0
     586:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   add.l d3,d0
     588:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d0,d5
     58a:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   addi.l #8192,d5
     590:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d5,8(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     594:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   moveq #3,d5
     596:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   cmp.l d1,d5
     598:	|  |  |  |  |  +--|-----|--|--|--|--|--|-----------|--|--------|--------|-- beq.w 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + (widthInBytes * i));
     59c:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   add.l d0,d3
     59e:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   addi.l #8192,d3
     5a4:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   move.l d3,12(a2)
        for (int i=0;i<numberOfBitplanes;i++) {
     5a8:	|  |  |  |  |  |  |     |  |  |  |  |  |           |  |        |        |   subq.l #4,d1
     5aa:	|  |  |  |  |  \--|-----|--|--|--|--|--|-----------|--|--------|--------|-- beq.w 1c8 <main+0x17a>
                bitplanes[i]=(UBYTE*)(image + (widthInBytes * i));
     5ae:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   add.l d0,d0
     5b0:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   addi.l #8192,d0
     5b6:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   move.l d0,16(a2)
        colorPalette=palette;
     5ba:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   move.l a5,22(a2)
    KPrintF("Operator new Called");
     5be:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   pea 1286 <incbin_tilescolors_end+0x2c>
     5c4:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     5c6:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   movea.l fe90 <SysBase>,a6
     5cc:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   moveq #56,d0
     5ce:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   moveq #0,d1
     5d0:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   jsr -198(a6)
     5d4:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   movea.l d0,a5
    Display::Display(UWORD mode,bool interleaved) {
     5d6:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   clr.b 54(a5)
        init(mode,interleaved);
     5da:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   pea 1 <_start+0x1>
     5de:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   pea 5000 <incbin_image_start+0x3000>
     5e2:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   move.l d0,-(sp)
     5e4:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   movea.l d2,a0
     5e6:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   jsr (a0)
        colorPalette=palette;
     5e8:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   move.l a3,22(a5)
    startScreen->show();
     5ec:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   move.l a2,-(sp)
     5ee:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   lea 9ba <_ZN7Display4showEv>,a2
     5f4:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   jsr (a2)
     5f6:	|  |  |  |  |     |     |  |  |  |  |  |           |  |        |        |   lea 20(sp),sp
     5fa:	|  |  |  |  |     \-----|--|--|--|--|--|-----------|--|--------|--------|-- bra.w 208 <main+0x1ba>
		Exit(0);
     5fe:	|  |  |  >--|-----------|--|--|--|--|--|-----------|--|--------|--------|-> movea.l fe8c <DOSBase>,a6
     604:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   moveq #0,d1
     606:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   jsr -144(a6)
     60a:	|  |  |  |  +-----------|--|--|--|--|--|-----------|--|--------|--------|-- bra.w aa <main+0x5c>
		Exit(0);
     60e:	>--|--|--|--|-----------|--|--|--|--|--|-----------|--|--------|--------|-> movea.l fe8c <DOSBase>,a6
     614:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   moveq #0,d1
     616:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   jsr -144(a6)
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
     61a:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   movea.l fe90 <SysBase>,a6
     620:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   lea 12c3 <incbin_tilescolors_end+0x69>,a1
     626:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   moveq #0,d0
     628:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   jsr -552(a6)
     62c:	|  |  |  |  |           |  |  |  |  |  |           |  |        |        |   move.l d0,fe88 <GfxBase>
	if (!GfxBase)
     632:	|  |  |  |  \-----------|--|--|--|--|--|-----------|--|--------|--------|-- bne.w aa <main+0x5c>
     636:	|  |  |  \--------------|--|--|--|--|--|-----------|--|--------|--------|-- bra.s 5fe <main+0x5b0>
		Exit(0);
     638:	|  |  \-----------------|--|--|--|--|--|-----------|--|--------|--------|-> suba.l a6,a6
     63a:	|  |                    |  |  |  |  |  |           |  |        |        |   moveq #0,d1
     63c:	|  |                    |  |  |  |  |  |           |  |        |        |   jsr -144(a6)
	IntuitionBase = (struct IntuitionBase *)OpenLibrary((CONST_STRPTR)"intuition.library",0);
     640:	|  |                    |  |  |  |  |  |           |  |        |        |   movea.l fe90 <SysBase>,a6
     646:	|  |                    |  |  |  |  |  |           |  |        |        |   lea 12b1 <incbin_tilescolors_end+0x57>,a1
     64c:	|  |                    |  |  |  |  |  |           |  |        |        |   moveq #0,d0
     64e:	|  |                    |  |  |  |  |  |           |  |        |        |   jsr -552(a6)
	if (!IntuitionBase)
     652:	|  |                    |  |  |  |  |  |           |  |        |        |   tst.l d0
     654:	|  \--------------------|--|--|--|--|--|-----------|--|--------|--------|-- bne.w 8e <main+0x40>
     658:	\-----------------------|--|--|--|--|--|-----------|--|--------|--------|-- bra.s 60e <main+0x5c0>
    KPrintF("Operator new Called");
     65a:	                        |  |  |  |  >--|-----------|--|--------|--------|-> pea 1286 <incbin_tilescolors_end+0x2c>
     660:	                        |  |  |  |  |  |           |  |        |        |   jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     662:	                        |  |  |  |  |  |           |  |        |        |   movea.l fe90 <SysBase>,a6
     668:	                        |  |  |  |  |  |           |  |        |        |   moveq #12,d0
     66a:	                        |  |  |  |  |  |           |  |        |        |   moveq #0,d1
     66c:	                        |  |  |  |  |  |           |  |        |        |   jsr -198(a6)
     670:	                        |  |  |  |  |  |           |  |        |        |   movea.l d0,a2
BlitterControl::BlitterControl() {
     672:	                        |  |  |  |  |  |           |  |        |        |   clr.l (a2)
     674:	                        |  |  |  |  |  |           |  |        |        |   clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     678:	                        |  |  |  |  |  |           |  |        |        |   move.l #14675968,8(a2)
    OwnBlitter();
     680:	                        |  |  |  |  |  |           |  |        |        |   movea.l (a3),a6
     682:	                        |  |  |  |  |  |           |  |        |        |   jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     686:	                        |  |  |  |  |  |           |  |        |        |   move.l a2,fe98 <_ZN14BlitterControl9singletonE>
     68c:	                        |  |  |  |  |  |           |  |        |        |   addq.l #4,sp
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     68e:	                        |  |  |  |  |  |           |  |        |        |   movea.l 8(a2),a0
     692:	                        |  |  |  |  |  |           |  |        |        |   move.w 2(a0),d0
     696:	                        |  |  |  |  |  |           |  |        |        |   move.w 2(a0),d1
     69a:	                        |  |  |  |  |  |           |  |        |        |   or.w d1,d0
    if (!isBlittingInProgress() && hasMoreScheduled() ) {
     69c:	                        |  |  |  |  |  |           |  |        |        |   btst #14,d0
     6a0:	                        |  |  |  |  |  |           |  |        |        \-- beq.w 4c2 <main+0x474>
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
     6a4:	                        |  |  |  |  |  |           |  |        \----------> move.w 2(a0),d0
     6a8:	                        |  |  |  |  |  |           |  |                     move.w 2(a0),d1
     6ac:	                        |  |  |  |  |  |           |  |                     or.w d1,d0
    } else if (isBlittingInProgress()) {
     6ae:	                        |  |  |  |  |  |           |  |                     btst #14,d0
     6b2:	                        |  |  |  |  |  |           \--|-------------------- beq.w 49e <main+0x450>
        KPrintF("blitter busy\n");
     6b6:	                        |  |  |  |  |  |              |                     pea 130a <incbin_tilescolors_end+0xb0>
     6bc:	                        |  |  |  |  |  |              |                     jsr (a4)
     6be:	                        |  |  |  |  |  |              |                     addq.l #4,sp
    if (BlitterControl::singleton==NULL) {
     6c0:	                        |  |  |  |  |  |              |                     movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     6c6:	                        |  |  |  |  |  |              |                     cmpa.w #0,a2
     6ca:	                        |  |  |  |  |  +--------------|-------------------- bne.w 4ac <main+0x45e>
     6ce:	                        |  |  |  |  +--|--------------|-------------------- bra.s 65a <main+0x60c>
    } else {
        lastScheduledBlitable=NULL;
     6d0:	                        |  |  |  |  |  |              \-------------------> clr.l 4(a2)
    if (BlitterControl::singleton==NULL) {
     6d4:	                        |  |  |  |  |  |                                    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     6da:	                        |  |  |  |  |  |                                    cmpa.w #0,a2
     6de:	                        |  |  |  |  |  +----------------------------------- bne.w 4ac <main+0x45e>
     6e2:	                        |  |  |  |  +--|----------------------------------- bra.w 65a <main+0x60c>
            lastScheduledBlitable=blit;
     6e6:	                        |  |  |  \--|--|----------------------------------> move.l a6,4(a2)
            currentBlit=blit;
     6ea:	                        |  |  |     |  |                                    move.l a6,(a2)
            currentBlit->blit();
     6ec:	                        |  |  |     |  |                                    movea.l (a6),a0
     6ee:	                        |  |  |     |  |                                    move.l a6,-(sp)
     6f0:	                        |  |  |     |  |                                    movea.l (a0),a0
     6f2:	                        |  |  |     |  |                                    jsr (a0)
}
     6f4:	                        |  |  |     |  |                                    addq.l #4,sp
            for (int x=0;x<visibleWidth;x++) {
     6f6:	                        |  |  |     |  |                                    addq.l #1,d2
     6f8:	                        |  |  |     |  |                                    cmp.l d6,d2
     6fa:	                        |  \--|-----|--|----------------------------------- blt.w 3c8 <main+0x37a>
     6fe:	                        |     \-----|--|----------------------------------- bra.w 488 <main+0x43a>
     702:	                        \-----------|--|----------------------------------> move.l #65160,d5
     708:	                                    |  |                                    movea.l d5,a3
    if (BlitterControl::singleton==NULL) {
     70a:	                                    |  |                                    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     710:	                                    |  |                                    cmpa.w #0,a2
     714:	                                    |  \----------------------------------- bne.w 4ac <main+0x45e>
     718:	                                    \-------------------------------------- bra.w 65a <main+0x60c>

0000071c <_ZN14BlitterControl8scheduleEP8Blitable>:
void BlitterControl::schedule(Blitable* blit){
     71c:	       move.l a2,-(sp)
     71e:	       movea.l 8(sp),a1
     722:	       movea.l 12(sp),a0
    if (blit->prev!=NULL || currentBlit==blit) {
     726:	       tst.l 8(a0)
     72a:	   /-- beq.s 730 <_ZN14BlitterControl8scheduleEP8Blitable+0x14>
}
     72c:	/--|-> movea.l (sp)+,a2
     72e:	|  |   rts
    if (blit->prev!=NULL || currentBlit==blit) {
     730:	|  \-> cmpa.l (a1),a0
     732:	\----- beq.s 72c <_ZN14BlitterControl8scheduleEP8Blitable+0x10>
    if (lastScheduledBlitable==NULL) {
     734:	       movea.l 4(a1),a2
     738:	       cmpa.w #0,a2
     73c:	   /-- beq.s 74e <_ZN14BlitterControl8scheduleEP8Blitable+0x32>
            blit->prev=lastScheduledBlitable;
     73e:	   |   move.l a2,8(a0)
            lastScheduledBlitable->next=blit;
     742:	   |   move.l a0,4(a2)
            lastScheduledBlitable=blit;
     746:	   |   move.l a0,4(a1)
}
     74a:	   |   movea.l (sp)+,a2
     74c:	   |   rts
            lastScheduledBlitable=blit;
     74e:	   \-> move.l a0,4(a1)
            currentBlit=blit;
     752:	       move.l a0,(a1)
            currentBlit->blit();
     754:	       movea.l (a0),a1
     756:	       move.l a0,8(sp)
     75a:	       movea.l (a1),a1
}
     75c:	       movea.l (sp)+,a2
            currentBlit->blit();
     75e:	       jmp (a1)

00000760 <_ZN10CopperList4moveEtt>:

    CopperList* CopperList::create() {
        return new CopperList();
    }

    CopperList* CopperList::move(UWORD customRegister, UWORD value) {
     760:	move.l a2,-(sp)
     762:	movea.l 8(sp),a1
     766:	move.l 16(sp),d0
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     76a:	movea.l 4(a1),a0
     76e:	move.w 14(sp),(a0)
        *copPointer++=value;
     772:	lea 4(a0),a2
     776:	move.l a2,4(a1)
     77a:	move.w d0,2(a0)
        *copPointer=0xffff;
     77e:	move.w #-1,4(a0)
        *(copPointer+2)=0xfffe;
     784:	move.w #-2,8(a0)
        setEndOfList();
        return this;
    }
     78a:	move.l a1,d0
     78c:	movea.l (sp)+,a2
     78e:	rts

00000790 <_ZN7Display4initEtb>:
    void Display::init(UWORD mode,bool interleaved) {
     790:	    movem.l d2-d4/a2/a6,-(sp)
     794:	    movea.l 24(sp),a2
     798:	    move.l 28(sp),d2
     79c:	    move.l 32(sp),d3
            custom = (struct Custom*)0xdff000;
     7a0:	    move.l #14675968,26(a2)
            bitplanes[0]=NULL;
     7a8:	    clr.l (a2)
            bitplanes[1]=NULL;
     7aa:	    clr.l 4(a2)
            bitplanes[2]=NULL;
     7ae:	    clr.l 8(a2)
            bitplanes[3]=NULL;
     7b2:	    clr.l 12(a2)
            bitplanes[4]=NULL;
     7b6:	    clr.l 16(a2)
	        originalActiView=GfxBase->ActiView; //store current view
     7ba:	    movea.l fe88 <GfxBase>,a6
     7c0:	    move.l 34(a6),30(a2)
            LoadView(0);
     7c6:	    suba.l a1,a1
     7c8:	    jsr -222(a6)
	        WaitTOF();
     7cc:	    movea.l fe88 <GfxBase>,a6
     7d2:	    jsr -270(a6)
	        WaitTOF();
     7d6:	    movea.l fe88 <GfxBase>,a6
     7dc:	    jsr -270(a6)
            if (modeid&HIRES) {
     7e0:	    move.l #640,d0
     7e6:	    tst.w d2
     7e8:	/-- blt.s 7f0 <_ZN7Display4initEtb+0x60>
     7ea:	|   move.l #320,d0
            this->interleaved=interleaved;
     7f0:	\-> move.b d3,54(a2)
            this->modeid=mode;
     7f4:	    move.w d2,20(a2)
                width=640;
     7f8:	    move.l d0,38(a2)
    UBYTE* Display::getBitplanes() {
        return (UBYTE*)bitplanes[0];
    }

    bool Display::isPAL() {
        return (((struct GfxBase *)  GfxBase)->DisplayFlags & PAL) ==PAL;
     7fc:	    movea.l fe88 <GfxBase>,a0
     802:	    moveq #55,d1
     804:	    not.b d1
            if (isPAL()) {
     806:	    btst #2,207(a0)
     80c:	/-- beq.s 814 <_ZN7Display4initEtb+0x84>
     80e:	|   move.l #256,d1
                height=256;
     814:	\-> move.l d1,42(a2)
            widthInBytes=width/8;
     818:	    asr.l #3,d0
     81a:	    move.l d0,46(a2)
            numberOfBitplanes=mode>>12&0b111;
     81e:	    moveq #12,d0
     820:	    lsr.w d0,d2
     822:	    moveq #7,d0
     824:	    and.l d2,d0
     826:	    move.l d0,50(a2)
    }
     82a:	    movem.l (sp)+,d2-d4/a2/a6
     82e:	    rts

00000830 <KPrintF>:
void KPrintF(const char* fmt, ...) {
     830:	    lea -128(sp),sp
     834:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     838:	    move.w f0ff60 <gcc8_c_support.c.915a8519+0xefd6c4>,d0
     83e:	    cmpi.w #20153,d0
     842:	/-- beq.s 86e <KPrintF+0x3e>
     844:	|   cmpi.w #-24562,d0
     848:	+-- beq.s 86e <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
     84a:	|   movea.l fe90 <SysBase>,a6
     850:	|   movea.l 144(sp),a0
     854:	|   lea 148(sp),a1
     858:	|   lea 10f2 <KPutCharX>,a2
     85e:	|   suba.l a3,a3
     860:	|   jsr -522(a6)
}
     864:	|   movem.l (sp)+,a2-a3/a6
     868:	|   lea 128(sp),sp
     86c:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
     86e:	\-> movea.l fe90 <SysBase>,a6
     874:	    movea.l 144(sp),a0
     878:	    lea 148(sp),a1
     87c:	    lea 1100 <PutChar>,a2
     882:	    lea 12(sp),a3
     886:	    jsr -522(a6)
		UaeDbgLog(86, temp);
     88a:	    move.l a3,-(sp)
     88c:	    pea 56 <main+0x8>
     890:	    jsr f0ff60 <gcc8_c_support.c.915a8519+0xefd6c4>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     896:	    addq.l #8,sp
}
     898:	    movem.l (sp)+,a2-a3/a6
     89c:	    lea 128(sp),sp
     8a0:	    rts

000008a2 <_ZN12TestBlitable4blitEv>:
            KPrintF("Blit Object\n");
     8a2:	move.l #4699,4(sp)
     8aa:	bra.s 830 <KPrintF>

000008ac <_ZN15ClearDisplayJob4blitEv>:
            KPrintF("clear display\n");
     8ac:	pea 1268 <incbin_tilescolors_end+0xe>
     8b2:	jsr 830 <KPrintF>(pc)
            custom->bltcon0 = A_TO_D | DEST;
     8b6:	movea.l 8(sp),a0
     8ba:	movea.l 12(a0),a0
     8be:	move.w #496,64(a0)
            custom->bltcon1 = 0;
     8c4:	move.w #0,66(a0)
            custom->bltadat = 0x0;
     8ca:	move.w #0,116(a0)
            custom->bltdpt = (APTR)image + 320 / 8 * 200 * 5;
     8d0:	move.l #48192,84(a0)
            custom->bltdmod = 0;
     8d8:	move.w #0,102(a0)
            custom->bltafwm = custom->bltalwm = 0xffff;
     8de:	move.w #-1,70(a0)
     8e4:	move.w #-1,68(a0)
            custom->bltsize = ((56 * 5) << HSIZEBITS) | (320/16);
     8ea:	move.w #17940,88(a0)
        }
     8f0:	addq.l #4,sp
     8f2:	rts

000008f4 <_ZN17CookieCutBlitTest4blitEv>:
            KPrintF("blit test bob\n");
     8f4:	pea 1277 <incbin_tilescolors_end+0x1d>
     8fa:	jsr 830 <KPrintF>(pc)
			custom->bltapt = src;
     8fe:	movea.l 8(sp),a0
     902:	movea.l 12(a0),a0
     906:	move.l #59394,80(a0)
			custom->bltamod = (UWORD) 32 / 8;
     90e:	move.w #4,100(a0)
			custom->bltbpt = (APTR) src + 32 / 8 * 1;
     914:	move.l #59398,76(a0)
			custom->bltbmod = (UWORD) 32 / 8;
     91c:	move.w #4,98(a0)
			custom->bltcpt = custom->bltdpt =  (APTR)image + 320 / 8 * 5 * (256 + y) + x / 8;
     922:	move.l #59392,84(a0)
     92a:	move.l #59392,72(a0)
			custom->bltcmod = custom->bltdmod = (UWORD) (320 - 32) / 8;
     932:	move.w #36,102(a0)
     938:	move.w #36,96(a0)
			custom->bltafwm = custom->bltalwm = 0xffff;
     93e:	move.w #-1,70(a0)
     944:	move.w #-1,68(a0)
			custom->bltcon0 = 0xca | SRCA | SRCB | SRCC | DEST | ((x & 15) << ASHIFTSHIFT); // A = source, B = mask, C = background, D = destination
     94a:	move.w #4042,64(a0)
			custom->bltcon1 = ((x & 15) << BSHIFTSHIFT);
     950:	move.w #0,66(a0)
			custom->bltsize = ((16 * 5) << HSIZEBITS) | (32/16);
     956:	move.w #5122,88(a0)
        }
     95c:	addq.l #4,sp
     95e:	rts

00000960 <_ZN14BlitterControl8instanceEv>:
BlitterControl* BlitterControl::instance(){
     960:	    move.l a6,-(sp)
     962:	    move.l a2,-(sp)
    if (BlitterControl::singleton==NULL) {
     964:	    movea.l fe98 <_ZN14BlitterControl9singletonE>,a2
     96a:	    cmpa.w #0,a2
     96e:	/-- beq.s 978 <_ZN14BlitterControl8instanceEv+0x18>
}
     970:	|   move.l a2,d0
     972:	|   movea.l (sp)+,a2
     974:	|   movea.l (sp)+,a6
     976:	|   rts
    KPrintF("Operator new Called");
     978:	\-> pea 1286 <incbin_tilescolors_end+0x2c>
     97e:	    jsr 830 <KPrintF>(pc)
    void *p = AllocMem( size, MEMF_ANY);
     982:	    movea.l fe90 <SysBase>,a6
     988:	    moveq #12,d0
     98a:	    moveq #0,d1
     98c:	    jsr -198(a6)
     990:	    movea.l d0,a2
BlitterControl::BlitterControl() {
     992:	    clr.l (a2)
     994:	    clr.l 4(a2)
    custom = (struct Custom*)0xdff000;
     998:	    move.l #14675968,8(a2)
    OwnBlitter();
     9a0:	    movea.l fe88 <GfxBase>,a6
     9a6:	    jsr -456(a6)
        BlitterControl::singleton=new BlitterControl;
     9aa:	    move.l a2,fe98 <_ZN14BlitterControl9singletonE>
     9b0:	    addq.l #4,sp
}
     9b2:	    move.l a2,d0
     9b4:	    movea.l (sp)+,a2
     9b6:	    movea.l (sp)+,a6
     9b8:	    rts

000009ba <_ZN7Display4showEv>:
   void Display::show () {
     9ba:	                      movem.l d2-d5/a2-a6,-(sp)
     9be:	                      movea.l 40(sp),a2
       if (bitplanes[0]==NULL) {
     9c2:	                      tst.l (a2)
     9c4:	   /----------------- beq.w c6a <_ZN7Display4showEv+0x2b0>
    KPrintF("Operator new Called");
     9c8:	/--|----------------> pea 1286 <incbin_tilescolors_end+0x2c>
     9ce:	|  |                  lea 830 <KPrintF>(pc),a4
     9d2:	|  |                  jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     9d4:	|  |                  movea.l fe90 <SysBase>,a6
     9da:	|  |                  moveq #8,d0
     9dc:	|  |                  moveq #0,d1
     9de:	|  |                  jsr -198(a6)
     9e2:	|  |                  movea.l d0,a3
        copperList= (USHORT*)AllocMem(1024, MEMF_CHIP);
     9e4:	|  |                  movea.l fe90 <SysBase>,a6
     9ea:	|  |                  move.l #1024,d0
     9f0:	|  |                  moveq #2,d1
     9f2:	|  |                  jsr -198(a6)
     9f6:	|  |                  move.l d0,(a3)
        copPointer=copperList;  // sets pointer to start of list;
     9f8:	|  |                  move.l d0,4(a3)
            ->move(offsetof (struct Custom, bplcon0) , modeid);
     9fc:	|  |                  pea 38 <_start+0x38>
     a00:	|  |                  pea 92 <main+0x44>
     a04:	|  |                  move.l a3,-(sp)
     a06:	|  |                  lea 760 <_ZN10CopperList4moveEtt>(pc),a5
     a0a:	|  |                  jsr (a5)
     a0c:	|  |                  pea d0 <main+0x82>
     a10:	|  |                  pea 94 <main+0x46>
     a14:	|  |                  move.l d0,-(sp)
     a16:	|  |                  jsr (a5)
     a18:	|  |                  pea 2c81 <incbin_image_start+0xc81>
     a1c:	|  |                  pea 8e <main+0x40>
     a20:	|  |                  move.l d0,-(sp)
     a22:	|  |                  jsr (a5)
        return (((struct GfxBase *)  GfxBase)->DisplayFlags & PAL) ==PAL;
     a24:	|  |                  movea.l fe88 <GfxBase>,a0
            ->move(offsetof (struct Custom, bplcon0) , modeid);
     a2a:	|  |                  lea 40(sp),sp
     a2e:	|  |                  move.l #11457,d1
     a34:	|  |                  btst #2,207(a0)
     a3a:	|  |              /-- bne.s a42 <_ZN7Display4showEv+0x88>
     a3c:	|  |              |   move.l #62657,d1
     a42:	|  |              \-> move.l d1,-(sp)
     a44:	|  |                  pea 90 <main+0x42>
     a48:	|  |                  move.l d0,-(sp)
     a4a:	|  |                  jsr (a5)
     a4c:	|  |                  moveq #0,d1
     a4e:	|  |                  move.w 20(a2),d1
     a52:	|  |                  move.l d1,-(sp)
     a54:	|  |                  pea 100 <main+0xb2>
     a58:	|  |                  move.l d0,-(sp)
     a5a:	|  |                  jsr (a5)
     a5c:	|  |                  movea.l d0,a3
                cl->move(offsetof (struct Custom, bpl1mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     )
     a5e:	|  |                  move.l 50(a2),d2
            if (this->interleaved) {
     a62:	|  |                  lea 24(sp),sp
     a66:	|  |                  tst.b 54(a2)
     a6a:	|  |  /-------------- beq.w c4e <_ZN7Display4showEv+0x294>
                cl->move(offsetof (struct Custom, bpl1mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     )
     a6e:	|  |  |               move.w d2,d3
     a70:	|  |  |               subq.w #1,d3
     a72:	|  |  |               muls.w 48(a2),d3
                  ->move(offsetof (struct Custom, bpl2mod),   (widthInBytes*numberOfBitplanes)-widthInBytes     );
     a76:	|  |  |               andi.l #65535,d3
     a7c:	|  |  |               move.l d3,-(sp)
     a7e:	|  |  |               pea 108 <main+0xba>
     a82:	|  |  |               move.l d0,-(sp)
     a84:	|  |  |               jsr (a5)
     a86:	|  |  |               move.l d3,-(sp)
     a88:	|  |  |               pea 10a <main+0xbc>
     a8c:	|  |  |               move.l d0,-(sp)
     a8e:	|  |  |               jsr (a5)
     a90:	|  |  |               lea 24(sp),sp
            for (int i=0;i<numberOfBitplanes;i++) {
     a94:	|  |  |  /----------> tst.l d2
     a96:	|  |  |  |     /----- ble.w bb4 <_ZN7Display4showEv+0x1fa>
     a9a:	|  |  |  |     |      movea.l 4(a3),a0
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes[i]);
     a9e:	|  |  |  |     |      move.l (a2),d1

    CopperList* CopperList::movePointer(UWORD customRegister, ULONG address) {
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     aa0:	|  |  |  |     |      move.w #224,(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     aa4:	|  |  |  |     |      move.l d1,d0
     aa6:	|  |  |  |     |      clr.w d0
     aa8:	|  |  |  |     |      swap d0
     aaa:	|  |  |  |     |      move.w d0,2(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     aae:	|  |  |  |     |      move.w #226,4(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     ab4:	|  |  |  |     |      move.w d1,d0
     ab6:	|  |  |  |     |      move.w d1,6(a0)
        *copPointer=0xffff;
     aba:	|  |  |  |     |      move.w #-1,8(a0)
        *(copPointer+2)=0xfffe;
     ac0:	|  |  |  |     |      move.w #-2,12(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     ac6:	|  |  |  |     |      moveq #1,d1
     ac8:	|  |  |  |     |      cmp.l d2,d1
     aca:	|  |  |  |     |  /-- beq.w b92 <_ZN7Display4showEv+0x1d8>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes[i]);
     ace:	|  |  |  |     |  |   move.l 4(a2),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     ad2:	|  |  |  |     |  |   move.w #228,8(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     ad8:	|  |  |  |     |  |   move.l d1,d0
     ada:	|  |  |  |     |  |   clr.w d0
     adc:	|  |  |  |     |  |   swap d0
     ade:	|  |  |  |     |  |   move.w d0,10(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     ae2:	|  |  |  |     |  |   move.w #230,12(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     ae8:	|  |  |  |     |  |   move.w d1,d0
     aea:	|  |  |  |     |  |   move.w d1,14(a0)
        *copPointer=0xffff;
     aee:	|  |  |  |     |  |   move.w #-1,16(a0)
        *(copPointer+2)=0xfffe;
     af4:	|  |  |  |     |  |   move.w #-2,20(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     afa:	|  |  |  |     |  |   moveq #2,d1
     afc:	|  |  |  |     |  |   cmp.l d2,d1
     afe:	|  |  |  |     |  +-- beq.w b92 <_ZN7Display4showEv+0x1d8>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes[i]);
     b02:	|  |  |  |     |  |   move.l 8(a2),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b06:	|  |  |  |     |  |   move.w #232,16(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     b0c:	|  |  |  |     |  |   move.l d1,d0
     b0e:	|  |  |  |     |  |   clr.w d0
     b10:	|  |  |  |     |  |   swap d0
     b12:	|  |  |  |     |  |   move.w d0,18(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b16:	|  |  |  |     |  |   move.w #234,20(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     b1c:	|  |  |  |     |  |   move.w d1,d0
     b1e:	|  |  |  |     |  |   move.w d1,22(a0)
        *copPointer=0xffff;
     b22:	|  |  |  |     |  |   move.w #-1,24(a0)
        *(copPointer+2)=0xfffe;
     b28:	|  |  |  |     |  |   move.w #-2,28(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     b2e:	|  |  |  |     |  |   moveq #3,d1
     b30:	|  |  |  |     |  |   cmp.l d2,d1
     b32:	|  |  |  |     |  +-- beq.s b92 <_ZN7Display4showEv+0x1d8>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes[i]);
     b34:	|  |  |  |     |  |   move.l 12(a2),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b38:	|  |  |  |     |  |   move.w #236,24(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     b3e:	|  |  |  |     |  |   move.l d1,d0
     b40:	|  |  |  |     |  |   clr.w d0
     b42:	|  |  |  |     |  |   swap d0
     b44:	|  |  |  |     |  |   move.w d0,26(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b48:	|  |  |  |     |  |   move.w #238,28(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     b4e:	|  |  |  |     |  |   move.w d1,d0
     b50:	|  |  |  |     |  |   move.w d1,30(a0)
        *copPointer=0xffff;
     b54:	|  |  |  |     |  |   move.w #-1,32(a0)
        *(copPointer+2)=0xfffe;
     b5a:	|  |  |  |     |  |   move.w #-2,36(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     b60:	|  |  |  |     |  |   moveq #4,d1
     b62:	|  |  |  |     |  |   cmp.l d2,d1
     b64:	|  |  |  |     |  +-- beq.s b92 <_ZN7Display4showEv+0x1d8>
                cl->movePointer(bitplaneRegister, (ULONG) bitplanes[i]);
     b66:	|  |  |  |     |  |   move.l 16(a2),d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b6a:	|  |  |  |     |  |   move.w #240,32(a0)
        *copPointer++=(UWORD)(address  >>16 ) & 0xffff;
     b70:	|  |  |  |     |  |   move.l d1,d0
     b72:	|  |  |  |     |  |   clr.w d0
     b74:	|  |  |  |     |  |   swap d0
     b76:	|  |  |  |     |  |   move.w d0,34(a0)
        *copPointer++=(customRegister+2) & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     b7a:	|  |  |  |     |  |   move.w #242,36(a0)
        *copPointer++=(UWORD)(address  ) & 0xffff;
     b80:	|  |  |  |     |  |   move.w d1,d0
     b82:	|  |  |  |     |  |   move.w d1,38(a0)
        *copPointer=0xffff;
     b86:	|  |  |  |     |  |   move.w #-1,40(a0)
        *(copPointer+2)=0xfffe;
     b8c:	|  |  |  |     |  |   move.w #-2,44(a0)
            for (int i=0;i<numberOfBitplanes;i++) {
     b92:	|  |  |  |     |  \-> move.l d2,d1
     b94:	|  |  |  |     |      subq.l #1,d1
     b96:	|  |  |  |     |      lsl.l #3,d1
     b98:	|  |  |  |     |      lea (0,a0,d1.l),a1
        *copPointer++=(UWORD)(address  ) & 0xffff;
     b9c:	|  |  |  |     |      lsl.l #3,d2
     b9e:	|  |  |  |     |      add.l a0,d2
     ba0:	|  |  |  |     |      move.l d2,4(a3)
     ba4:	|  |  |  |     |      move.w d0,6(a1)
     ba8:	|  |  |  |     |      move.w #-1,8(a1)
     bae:	|  |  |  |     |      move.w #-2,12(a1)
            if (colorPalette!=NULL) {
     bb4:	|  |  |  |     \----> movea.l 22(a2),a0
     bb8:	|  |  |  |            cmpa.w #0,a0
     bbc:	|  |  |  |     /----- beq.s c18 <_ZN7Display4showEv+0x25e>
}

void ColorPalette::appendtoCopper(CopperList* copperList) {
    UWORD reg=0x180;
    for (int i=0; i<numberOfColors; i++) {
     bbe:	|  |  |  |     |      move.l 4(a0),d2
     bc2:	|  |  |  |     +----- ble.s c18 <_ZN7Display4showEv+0x25e>
     bc4:	|  |  |  |     |      move.l 4(a3),d3
     bc8:	|  |  |  |     |      movea.l (a0),a1
     bca:	|  |  |  |     |      movea.l d2,a5
     bcc:	|  |  |  |     |      adda.l d2,a5
     bce:	|  |  |  |     |      move.l a5,d5
     bd0:	|  |  |  |     |      add.l a1,d5
        copperList->move(reg,   ((USHORT*)colors)[i]) ;
     bd2:	|  |  |  |     |      movea.l d3,a0
     bd4:	|  |  |  |     |      move.w #384,d4
     bd8:	|  |  |  |     |      sub.w a1,d4
     bda:	|  |  |  |     |  /-> move.w d4,d0
     bdc:	|  |  |  |     |  |   add.w a1,d0
     bde:	|  |  |  |     |  |   move.w (a1)+,d1
        *copPointer++=customRegister & 0xfffe; // ensure bit 0 is cleared, this indicates the word as a Copper Mov
     be0:	|  |  |  |     |  |   move.w d0,(a0)
     be2:	|  |  |  |     |  |   addq.l #4,a0
        *copPointer++=value;
     be4:	|  |  |  |     |  |   move.w d1,-2(a0)
        *copPointer=0xffff;
     be8:	|  |  |  |     |  |   move.w #-1,(a0)
        *(copPointer+2)=0xfffe;
     bec:	|  |  |  |     |  |   move.w #-2,4(a0)
    for (int i=0; i<numberOfColors; i++) {
     bf2:	|  |  |  |     |  |   cmp.l a1,d5
     bf4:	|  |  |  |     |  \-- bne.s bda <_ZN7Display4showEv+0x220>
     bf6:	|  |  |  |     |      movea.l d2,a0
     bf8:	|  |  |  |     |      subq.l #1,a0
     bfa:	|  |  |  |     |      adda.l a0,a0
     bfc:	|  |  |  |     |      adda.l a0,a0
     bfe:	|  |  |  |     |      adda.l d3,a0
        *copPointer++=value;
     c00:	|  |  |  |     |      adda.l a5,a5
     c02:	|  |  |  |     |      add.l a5,d3
     c04:	|  |  |  |     |      move.l d3,4(a3)
     c08:	|  |  |  |     |      move.w d1,2(a0)
     c0c:	|  |  |  |     |      move.w #-1,4(a0)
     c12:	|  |  |  |     |      move.w #-2,8(a0)
        copperList=buildCopperList();
     c18:	|  |  |  |     \----> move.l a3,34(a2)
        KPrintF("free resources for Copper Singleton");
    }

 
    Copper* Copper::instance(){
        if (Copper::singleton==NULL) {
     c1c:	|  |  |  |            movea.l fe94 <_ZN6Copper9singletonE>,a0
     c22:	|  |  |  |            cmpa.w #0,a0
     c26:	|  |  |  |  /-------- beq.w cdc <_ZN7Display4showEv+0x322>
            Copper::singleton=new Copper;
        }
        return Copper::singleton;
     c2a:	|  |  |  |  |         movea.l (a0),a0
        return (ULONG) copperList;
     c2c:	|  |  |  |  |         move.l (a3),d0
    void Copper::useCopperList(ULONG copperList) {
        custom->cop1lc = copperList;
    }

    void Copper::useCopperList(CopperList* copperList) {
        custom->cop1lc = copperList->getCopperListPointer();
     c2e:	|  |  |  |  |         move.l d0,128(a0)
        custom->dmacon = DMAF_BLITTER;//disable blitter dma for copjmp bug
     c32:	|  |  |  |  |         movea.l 26(a2),a0
     c36:	|  |  |  |  |         move.w #64,150(a0)
	    custom->copjmp1 = 0x7fff; //start coppper
     c3c:	|  |  |  |  |         move.w #32767,136(a0)
	    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;
     c42:	|  |  |  |  |         move.w #-31808,150(a0)
    }
     c48:	|  |  |  |  |         movem.l (sp)+,d2-d5/a2-a6
     c4c:	|  |  |  |  |         rts
                  ->move(offsetof (struct Custom, bpl2mod),   0x0     );
     c4e:	|  |  \--|--|-------> clr.l -(sp)
     c50:	|  |     |  |         pea 108 <main+0xba>
     c54:	|  |     |  |         move.l d0,-(sp)
     c56:	|  |     |  |         jsr (a5)
     c58:	|  |     |  |         clr.l -(sp)
     c5a:	|  |     |  |         pea 10a <main+0xbc>
     c5e:	|  |     |  |         move.l d0,-(sp)
     c60:	|  |     |  |         jsr (a5)
     c62:	|  |     |  |         lea 24(sp),sp
     c66:	|  |     \--|-------- bra.w a94 <_ZN7Display4showEv+0xda>
           bitplanes[0]=(UBYTE *)AllocMem( widthInBytes*height*numberOfBitplanes, MEMF_CHIP);
     c6a:	|  \--------|-------> lea ff8 <__mulsi3>,a3
     c70:	|           |         move.l 42(a2),-(sp)
     c74:	|           |         move.l 46(a2),-(sp)
     c78:	|           |         jsr (a3)
     c7a:	|           |         addq.l #4,sp
     c7c:	|           |         move.l 50(a2),(sp)
     c80:	|           |         move.l d0,-(sp)
     c82:	|           |         jsr (a3)
     c84:	|           |         addq.l #8,sp
     c86:	|           |         movea.l fe90 <SysBase>,a6
     c8c:	|           |         moveq #2,d1
     c8e:	|           |         jsr -198(a6)
     c92:	|           |         move.l d0,d2
     c94:	|           |         move.l d0,(a2)
           int bitplanesize=widthInBytes*height;
     c96:	|           |         move.l 46(a2),d3
     c9a:	|           |         move.l 42(a2),-(sp)
     c9e:	|           |         move.l d3,-(sp)
     ca0:	|           |         jsr (a3)
     ca2:	|           |         addq.l #8,sp
           for (int i=1;i<numberOfBitplanes;i++) {
     ca4:	|           |         movea.l 50(a2),a1
     ca8:	|           |         moveq #1,d1
     caa:	|           |         cmp.l a1,d1
     cac:	+-----------|-------- bge.w 9c8 <_ZN7Display4showEv+0xe>
     cb0:	|           |         tst.b 54(a2)
     cb4:	|           |  /----- bne.s d2a <_ZN7Display4showEv+0x370>
     cb6:	|           |  |      move.l d2,d1
     cb8:	|           |  |      add.l d0,d1
     cba:	|           |  |      lea 4(a2),a3
     cbe:	|           |  |      movea.w #1,a0
                bitplanes[i]=(UBYTE*)(bitplanes[0] + bitplanesize * i);
     cc2:	|           |  |  /-> move.l d1,(a3)+
           for (int i=1;i<numberOfBitplanes;i++) {
     cc4:	|           |  |  |   addq.l #1,a0
     cc6:	|           |  |  |   add.l d0,d1
     cc8:	|           |  |  |   cmpa.l a1,a0
     cca:	+-----------|--|--|-- beq.w 9c8 <_ZN7Display4showEv+0xe>
                bitplanes[i]=(UBYTE*)(bitplanes[0] + bitplanesize * i);
     cce:	|           |  |  |   move.l d1,(a3)+
           for (int i=1;i<numberOfBitplanes;i++) {
     cd0:	|           |  |  |   addq.l #1,a0
     cd2:	|           |  |  |   add.l d0,d1
     cd4:	|           |  |  |   cmpa.l a1,a0
     cd6:	|           |  |  \-- bne.s cc2 <_ZN7Display4showEv+0x308>
     cd8:	+-----------|--|----- bra.w 9c8 <_ZN7Display4showEv+0xe>
    KPrintF("Operator new Called");
     cdc:	|           \--|----> pea 1286 <incbin_tilescolors_end+0x2c>
     ce2:	|              |      jsr (a4)
    void *p = AllocMem( size, MEMF_ANY);
     ce4:	|              |      movea.l fe90 <SysBase>,a6
     cea:	|              |      moveq #4,d0
     cec:	|              |      moveq #0,d1
     cee:	|              |      jsr -198(a6)
     cf2:	|              |      movea.l d0,a0
        custom = (struct Custom*)0xdff000;
     cf4:	|              |      move.l #14675968,(a0)
            Copper::singleton=new Copper;
     cfa:	|              |      move.l d0,fe94 <_ZN6Copper9singletonE>
        Copper::instance()->useCopperList(
     d00:	|              |      movea.l 34(a2),a3
     d04:	|              |      addq.l #4,sp
        return Copper::singleton;
     d06:	|              |      movea.l (a0),a0
        return (ULONG) copperList;
     d08:	|              |      move.l (a3),d0
        custom->cop1lc = copperList->getCopperListPointer();
     d0a:	|              |      move.l d0,128(a0)
        custom->dmacon = DMAF_BLITTER;//disable blitter dma for copjmp bug
     d0e:	|              |      movea.l 26(a2),a0
     d12:	|              |      move.w #64,150(a0)
	    custom->copjmp1 = 0x7fff; //start coppper
     d18:	|              |      move.w #32767,136(a0)
	    custom->dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER | DMAF_BLITTER;
     d1e:	|              |      move.w #-31808,150(a0)
    }
     d24:	|              |      movem.l (sp)+,d2-d5/a2-a6
     d28:	|              |      rts
     d2a:	|              \----> move.l d2,d0
     d2c:	|                     add.l d3,d0
     d2e:	|                     lea 4(a2),a0
           for (int i=1;i<numberOfBitplanes;i++) {
     d32:	|                     moveq #1,d1
                bitplanes[i]=(UBYTE*)(bitplanes[0] + bitplanesize * i);
     d34:	|                 /-> move.l d0,(a0)+
           for (int i=1;i<numberOfBitplanes;i++) {
     d36:	|                 |   addq.l #1,d1
     d38:	|                 |   add.l d3,d0
     d3a:	|                 |   cmpa.l d1,a1
     d3c:	+-----------------|-- beq.w 9c8 <_ZN7Display4showEv+0xe>
                bitplanes[i]=(UBYTE*)(bitplanes[0] + bitplanesize * i);
     d40:	|                 |   move.l d0,(a0)+
           for (int i=1;i<numberOfBitplanes;i++) {
     d42:	|                 |   addq.l #1,d1
     d44:	|                 |   add.l d3,d0
     d46:	|                 |   cmpa.l d1,a1
     d48:	|                 \-- bne.s d34 <_ZN7Display4showEv+0x37a>
     d4a:	\-------------------- bra.w 9c8 <_ZN7Display4showEv+0xe>

00000d4e <_ZN4Tile4blitEv>:
}

void Tile::blit()  {
     d4e:	move.l a2,-(sp)
     d50:	movea.l 8(sp),a2
            KPrintF("Copy tile\n");
     d54:	pea 129a <incbin_tilescolors_end+0x40>
     d5a:	jsr 830 <KPrintF>(pc)
            custom->bltadat = 0xf0;
     d5e:	movea.l 12(a2),a0
     d62:	move.w #240,116(a0)
       // dma src B & C disabled so set all dat bits  for  channels per convention
            custom->bltbdat = 0xffff;
     d68:	move.w #-1,114(a0)
            custom->bltcdat = 0xffff;
     d6e:	move.w #-1,112(a0)

            custom->bltcon0 = A_TO_D | SRCA | DEST; // 0x00f0;
     d74:	move.w #2544,64(a0)
            custom->bltcon1 = 0;
     d7a:	move.w #0,66(a0)
            custom->bltafwm = custom->bltalwm = 0xffff;
     d80:	move.w #-1,70(a0)
     d86:	move.w #-1,68(a0)
            custom->bltamod = (UWORD) 0;
     d8c:	move.w #0,100(a0)
            custom->bltdmod = (UWORD) display->widthInBytes - tileWidthInBytes;
     d92:	movea.l 16(a2),a1
     d96:	move.w 48(a1),d0
     d9a:	sub.w 24(a2),d0
     d9e:	move.w d0,102(a0)

            custom->bltapt = this->tilePointer;
     da2:	move.l 50(a2),80(a0)
            custom->bltdpt = ((UBYTE*) display->getBitplanes()) + xPosOffset + yPosOffset; //  320 / 8 * 200 * 5;
     da8:	move.l 38(a2),d0
     dac:	add.l 42(a2),d0
     db0:	add.l (a1),d0
     db2:	move.l d0,84(a0)

            custom->bltsize = (UWORD) ((tileHeight  * 5) << HSIZEBITS) | (tileWidthInWords);
     db6:	move.w 22(a2),d0
     dba:	add.w d0,d0
     dbc:	add.w d0,d0
     dbe:	add.w 22(a2),d0
     dc2:	lsl.w #6,d0
     dc4:	or.w 26(a2),d0
     dc8:	move.w d0,88(a0)
}
     dcc:	addq.l #4,sp
     dce:	movea.l (sp)+,a2
     dd0:	rts

00000dd2 <strlen>:
unsigned long strlen(const char* s) {
     dd2:	       movea.l 4(sp),a0
	unsigned long t=0;
     dd6:	       moveq #0,d0
	while(*s++)
     dd8:	       tst.b (a0)
     dda:	/----- beq.s de4 <strlen+0x12>
		t++;
     ddc:	|  /-> addq.l #1,d0
	while(*s++)
     dde:	|  |   tst.b (0,a0,d0.l)
     de2:	|  \-- bne.s ddc <strlen+0xa>
}
     de4:	\----> rts

00000de6 <memset>:
	void* memset(void *dest, int val, unsigned long len) {
     de6:	          movem.l d2-d7/a2-a3,-(sp)
     dea:	          move.l 36(sp),d0
     dee:	          move.l 40(sp),d4
     df2:	          movea.l 44(sp),a1
	while(len-- > 0)
     df6:	          move.l a1,d5
     df8:	          subq.l #1,d5
     dfa:	          cmpa.w #0,a1
     dfe:	/-------- beq.w eae <memset+0xc8>
		*ptr++ = val;
     e02:	|         move.b d4,d7
     e04:	|         move.l d0,d1
     e06:	|         neg.l d1
     e08:	|         moveq #3,d2
     e0a:	|         and.l d2,d1
     e0c:	|         moveq #5,d6
     e0e:	|         movea.l d0,a2
     e10:	|         cmp.l d5,d6
     e12:	|  /----- bcc.s e7e <memset+0x98>
     e14:	|  |      tst.l d1
     e16:	|  |  /-- beq.s e3c <memset+0x56>
     e18:	|  |  |   move.b d4,(a2)+
	while(len-- > 0)
     e1a:	|  |  |   subq.l #1,d5
     e1c:	|  |  |   moveq #1,d2
     e1e:	|  |  |   cmp.l d1,d2
     e20:	|  |  +-- beq.s e3c <memset+0x56>
		*ptr++ = val;
     e22:	|  |  |   movea.l d0,a2
     e24:	|  |  |   addq.l #2,a2
     e26:	|  |  |   movea.l d0,a0
     e28:	|  |  |   move.b d4,1(a0)
	while(len-- > 0)
     e2c:	|  |  |   subq.l #1,d5
     e2e:	|  |  |   moveq #3,d2
     e30:	|  |  |   cmp.l d1,d2
     e32:	|  |  +-- bne.s e3c <memset+0x56>
		*ptr++ = val;
     e34:	|  |  |   addq.l #1,a2
     e36:	|  |  |   move.b d4,2(a0)
	while(len-- > 0)
     e3a:	|  |  |   subq.l #1,d5
     e3c:	|  |  \-> move.l a1,d3
     e3e:	|  |      sub.l d1,d3
     e40:	|  |      moveq #0,d6
     e42:	|  |      move.b d4,d6
     e44:	|  |      move.l d6,d2
     e46:	|  |      swap d2
     e48:	|  |      clr.w d2
     e4a:	|  |      movea.l d2,a0
     e4c:	|  |      move.l d4,d2
     e4e:	|  |      lsl.w #8,d2
     e50:	|  |      swap d2
     e52:	|  |      clr.w d2
     e54:	|  |      lsl.l #8,d6
     e56:	|  |      movea.l d6,a3
     e58:	|  |      move.l a0,d6
     e5a:	|  |      or.l d6,d2
     e5c:	|  |      move.l a3,d6
     e5e:	|  |      or.l d6,d2
     e60:	|  |      move.b d7,d2
     e62:	|  |      movea.l d0,a0
     e64:	|  |      adda.l d1,a0
     e66:	|  |      moveq #-4,d1
     e68:	|  |      and.l d3,d1
     e6a:	|  |      add.l a0,d1
		*ptr++ = val;
     e6c:	|  |  /-> move.l d2,(a0)+
	while(len-- > 0)
     e6e:	|  |  |   cmp.l a0,d1
     e70:	|  |  \-- bne.s e6c <memset+0x86>
     e72:	|  |      moveq #-4,d1
     e74:	|  |      and.l d3,d1
     e76:	|  |      adda.l d1,a2
     e78:	|  |      sub.l d1,d5
     e7a:	|  |      cmp.l d3,d1
     e7c:	+--|----- beq.s eae <memset+0xc8>
		*ptr++ = val;
     e7e:	|  \----> move.b d4,(a2)
	while(len-- > 0)
     e80:	|         tst.l d5
     e82:	+-------- beq.s eae <memset+0xc8>
		*ptr++ = val;
     e84:	|         move.b d4,1(a2)
	while(len-- > 0)
     e88:	|         moveq #1,d1
     e8a:	|         cmp.l d5,d1
     e8c:	+-------- beq.s eae <memset+0xc8>
		*ptr++ = val;
     e8e:	|         move.b d4,2(a2)
	while(len-- > 0)
     e92:	|         moveq #2,d2
     e94:	|         cmp.l d5,d2
     e96:	+-------- beq.s eae <memset+0xc8>
		*ptr++ = val;
     e98:	|         move.b d4,3(a2)
	while(len-- > 0)
     e9c:	|         moveq #3,d6
     e9e:	|         cmp.l d5,d6
     ea0:	+-------- beq.s eae <memset+0xc8>
		*ptr++ = val;
     ea2:	|         move.b d4,4(a2)
	while(len-- > 0)
     ea6:	|         subq.l #4,d5
     ea8:	+-------- beq.s eae <memset+0xc8>
		*ptr++ = val;
     eaa:	|         move.b d4,5(a2)
}
     eae:	\-------> movem.l (sp)+,d2-d7/a2-a3
     eb2:	          rts

00000eb4 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
     eb4:	          movem.l d2-d6,-(sp)
     eb8:	          move.l 24(sp),d0
     ebc:	          move.l 28(sp),d1
     ec0:	          move.l 32(sp),d3
	while(len--)
     ec4:	          move.l d3,d4
     ec6:	          subq.l #1,d4
     ec8:	          tst.l d3
     eca:	/-------- beq.s f2a <memcpy+0x76>
     ecc:	|         movea.l d1,a0
     ece:	|         addq.l #1,a0
     ed0:	|         move.l d0,d2
     ed2:	|         sub.l a0,d2
     ed4:	|         moveq #2,d5
     ed6:	|         cmp.l d2,d5
     ed8:	|         sc.s d2
     eda:	|         neg.b d2
     edc:	|         moveq #6,d6
     ede:	|         cmp.l d4,d6
     ee0:	|         sc.s d5
     ee2:	|         neg.b d5
     ee4:	|         and.b d5,d2
     ee6:	|  /----- beq.s f30 <memcpy+0x7c>
     ee8:	|  |      move.l d0,d2
     eea:	|  |      or.l d1,d2
     eec:	|  |      moveq #3,d5
     eee:	|  |      and.l d5,d2
     ef0:	|  +----- bne.s f30 <memcpy+0x7c>
     ef2:	|  |      movea.l d1,a0
     ef4:	|  |      movea.l d0,a1
     ef6:	|  |      moveq #-4,d2
     ef8:	|  |      and.l d3,d2
     efa:	|  |      add.l d1,d2
		*d++ = *s++;
     efc:	|  |  /-> move.l (a0)+,(a1)+
	while(len--)
     efe:	|  |  |   cmp.l a0,d2
     f00:	|  |  \-- bne.s efc <memcpy+0x48>
     f02:	|  |      moveq #-4,d2
     f04:	|  |      and.l d3,d2
     f06:	|  |      movea.l d0,a0
     f08:	|  |      adda.l d2,a0
     f0a:	|  |      add.l d2,d1
     f0c:	|  |      sub.l d2,d4
     f0e:	|  |      cmp.l d3,d2
     f10:	+--|----- beq.s f2a <memcpy+0x76>
		*d++ = *s++;
     f12:	|  |      movea.l d1,a1
     f14:	|  |      move.b (a1),(a0)
	while(len--)
     f16:	|  |      tst.l d4
     f18:	+--|----- beq.s f2a <memcpy+0x76>
		*d++ = *s++;
     f1a:	|  |      move.b 1(a1),1(a0)
	while(len--)
     f20:	|  |      subq.l #1,d4
     f22:	+--|----- beq.s f2a <memcpy+0x76>
		*d++ = *s++;
     f24:	|  |      move.b 2(a1),2(a0)
}
     f2a:	>--|----> movem.l (sp)+,d2-d6
     f2e:	|  |      rts
     f30:	|  \----> movea.l d0,a1
     f32:	|         add.l d3,d1
		*d++ = *s++;
     f34:	|     /-> move.b -1(a0),(a1)+
	while(len--)
     f38:	|     |   cmpa.l d1,a0
     f3a:	\-----|-- beq.s f2a <memcpy+0x76>
     f3c:	      |   addq.l #1,a0
     f3e:	      \-- bra.s f34 <memcpy+0x80>

00000f40 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
     f40:	             movem.l d2-d5/a2,-(sp)
     f44:	             move.l 24(sp),d0
     f48:	             move.l 28(sp),d1
     f4c:	             move.l 32(sp),d2
		while (len--)
     f50:	             movea.l d2,a1
     f52:	             subq.l #1,a1
	if (d < s) {
     f54:	             cmp.l d0,d1
     f56:	      /----- bls.s fc4 <memmove+0x84>
		while (len--)
     f58:	      |      tst.l d2
     f5a:	/-----|----- beq.s fbe <memmove+0x7e>
     f5c:	|     |      movea.l d1,a2
     f5e:	|     |      addq.l #1,a2
     f60:	|     |      move.l d0,d3
     f62:	|     |      sub.l a2,d3
     f64:	|     |      moveq #2,d4
     f66:	|     |      cmp.l d3,d4
     f68:	|     |      sc.s d3
     f6a:	|     |      neg.b d3
     f6c:	|     |      moveq #6,d5
     f6e:	|     |      cmp.l a1,d5
     f70:	|     |      sc.s d4
     f72:	|     |      neg.b d4
     f74:	|     |      and.b d4,d3
     f76:	|  /--|----- beq.s fe8 <memmove+0xa8>
     f78:	|  |  |      move.l d0,d3
     f7a:	|  |  |      or.l d1,d3
     f7c:	|  |  |      moveq #3,d4
     f7e:	|  |  |      and.l d4,d3
     f80:	|  +--|----- bne.s fe8 <memmove+0xa8>
     f82:	|  |  |      movea.l d1,a0
     f84:	|  |  |      movea.l d0,a2
     f86:	|  |  |      moveq #-4,d3
     f88:	|  |  |      and.l d2,d3
     f8a:	|  |  |      add.l d1,d3
			*d++ = *s++;
     f8c:	|  |  |  /-> move.l (a0)+,(a2)+
		while (len--)
     f8e:	|  |  |  |   cmp.l a0,d3
     f90:	|  |  |  \-- bne.s f8c <memmove+0x4c>
     f92:	|  |  |      moveq #-4,d3
     f94:	|  |  |      and.l d2,d3
     f96:	|  |  |      movea.l d0,a2
     f98:	|  |  |      adda.l d3,a2
     f9a:	|  |  |      movea.l d1,a0
     f9c:	|  |  |      adda.l d3,a0
     f9e:	|  |  |      suba.l d3,a1
     fa0:	|  |  |      cmp.l d2,d3
     fa2:	+--|--|----- beq.s fbe <memmove+0x7e>
			*d++ = *s++;
     fa4:	|  |  |      move.b (a0),(a2)
		while (len--)
     fa6:	|  |  |      cmpa.w #0,a1
     faa:	+--|--|----- beq.s fbe <memmove+0x7e>
			*d++ = *s++;
     fac:	|  |  |      move.b 1(a0),1(a2)
		while (len--)
     fb2:	|  |  |      moveq #1,d5
     fb4:	|  |  |      cmp.l a1,d5
     fb6:	+--|--|----- beq.s fbe <memmove+0x7e>
			*d++ = *s++;
     fb8:	|  |  |      move.b 2(a0),2(a2)
}
     fbe:	>--|--|----> movem.l (sp)+,d2-d5/a2
     fc2:	|  |  |      rts
		const char *lasts = s + (len - 1);
     fc4:	|  |  \----> lea (0,a1,d1.l),a0
		char *lastd = d + (len - 1);
     fc8:	|  |         adda.l d0,a1
		while (len--)
     fca:	|  |         tst.l d2
     fcc:	+--|-------- beq.s fbe <memmove+0x7e>
     fce:	|  |         move.l a0,d1
     fd0:	|  |         sub.l d2,d1
			*lastd-- = *lasts--;
     fd2:	|  |     /-> move.b (a0),(a1)
		while (len--)
     fd4:	|  |     |   subq.l #1,a0
     fd6:	|  |     |   subq.l #1,a1
     fd8:	|  |     |   cmp.l a0,d1
     fda:	+--|-----|-- beq.s fbe <memmove+0x7e>
			*lastd-- = *lasts--;
     fdc:	|  |     |   move.b (a0),(a1)
		while (len--)
     fde:	|  |     |   subq.l #1,a0
     fe0:	|  |     |   subq.l #1,a1
     fe2:	|  |     |   cmp.l a0,d1
     fe4:	|  |     \-- bne.s fd2 <memmove+0x92>
     fe6:	+--|-------- bra.s fbe <memmove+0x7e>
     fe8:	|  \-------> movea.l d0,a1
     fea:	|            add.l d2,d1
			*d++ = *s++;
     fec:	|        /-> move.b -1(a2),(a1)+
		while (len--)
     ff0:	|        |   cmp.l a2,d1
     ff2:	\--------|-- beq.s fbe <memmove+0x7e>
     ff4:	         |   addq.l #1,a2
     ff6:	         \-- bra.s fec <memmove+0xac>

00000ff8 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
     ff8:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
     ffc:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1000:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1004:	mulu.w 8(sp),d1
	addw	d1, d0
    1008:	add.w d1,d0
	swap	d0
    100a:	swap d0
	clrw	d0
    100c:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    100e:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1012:	mulu.w 10(sp),d1
	addl	d1, d0
    1016:	add.l d1,d0
	rts
    1018:	rts

0000101a <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    101a:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    101c:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1020:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    1024:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    102a:	   /-- bcc.s 1042 <__udivsi3+0x28>
	movel	d0, d2
    102c:	   |   move.l d0,d2
	clrw	d2
    102e:	   |   clr.w d2
	swap	d2
    1030:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    1032:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1034:	   |   move.w d2,d0
	swap	d0
    1036:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1038:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    103c:	   |   divu.w d1,d2
	movew	d2, d0
    103e:	   |   move.w d2,d0
	jra	6f
    1040:	/--|-- bra.s 1072 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1042:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    1044:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    1046:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    1048:	|  |   cmpi.l #65536,d1
	jcc	4b
    104e:	|  \-- bcc.s 1044 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1050:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    1052:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1058:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    105a:	|      mulu.w d0,d1
	swap	d2
    105c:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    105e:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1060:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    1062:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1064:	|  /-- bne.s 1070 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1066:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1068:	|  +-- bcs.s 1070 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    106a:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    106e:	+--|-- bls.s 1072 <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    1070:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    1072:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    1074:	       rts

00001076 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    1076:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    1078:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    107a:	    move.l 12(sp),d1
	jpl	1f
    107e:	/-- bpl.s 1084 <__divsi3+0xe>
	negl	d1
    1080:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1082:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1084:	\-> move.l 8(sp),d0
	jpl	2f
    1088:	/-- bpl.s 108e <__divsi3+0x18>
	negl	d0
    108a:	|   neg.l d0
	negb	d2
    108c:	|   neg.b d2

2:	movel	d1, sp@-
    108e:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1090:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    1092:	    bsr.s 101a <__udivsi3>
	addql	#8, sp
    1094:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    1096:	    tst.b d2
	jpl	3f
    1098:	/-- bpl.s 109c <__divsi3+0x26>
	negl	d0
    109a:	|   neg.l d0

3:	movel	sp@+, d2
    109c:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    109e:	    rts

000010a0 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    10a0:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    10a4:	move.l 4(sp),d0
	movel	d1, sp@-
    10a8:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    10aa:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    10ac:	bsr.s 1076 <__divsi3>
	addql	#8, sp
    10ae:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    10b0:	move.l 8(sp),d1
	movel	d1, sp@-
    10b4:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    10b6:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    10b8:	bsr.w ff8 <__mulsi3>
	addql	#8, sp
    10bc:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    10be:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    10c2:	sub.l d0,d1
	movel	d1, d0
    10c4:	move.l d1,d0
	rts
    10c6:	rts

000010c8 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    10c8:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    10cc:	move.l 4(sp),d0
	movel	d1, sp@-
    10d0:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    10d2:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    10d4:	bsr.w 101a <__udivsi3>
	addql	#8, sp
    10d8:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    10da:	move.l 8(sp),d1
	movel	d1, sp@-
    10de:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    10e0:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    10e2:	bsr.w ff8 <__mulsi3>
	addql	#8, sp
    10e6:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    10e8:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    10ec:	sub.l d0,d1
	movel	d1, d0
    10ee:	move.l d1,d0
	rts
    10f0:	rts

000010f2 <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    10f2:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    10f4:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    10f8:	jsr -516(a6)
    move.l (sp)+, a6
    10fc:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    10fe:	rts

00001100 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    1100:	move.b d0,(a3)+
	rts
    1102:	rts

00001104 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    1104:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    1106:	                         adda.l a0,a2
	move.l	a2,a3
    1108:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    110a:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    110c:	                         moveq #56,d4
	moveq	#8,d5
    110e:	                         moveq #8,d5
	bra.s	.Lliteral
    1110:	   /-------------------- bra.s 117a <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    1112:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    1114:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    1116:	+--|-------------------- dbf d1,1112 <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    111a:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    111c:	|  |     /-------------- bcc.s 1120 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    111e:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    1120:	|  |  |  >-------------> tst.w d0
    1122:	|  |  |  |           /-- bne.s 112c <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    1124:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    1126:	|  |  |  |           |   bls.s 119e <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    1128:	|  |  |  |           |   move.w (a0)+,d0
    112a:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    112c:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    112e:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    1130:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    1132:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    1134:	|  |  |  |               movem.w (1198 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    113a:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    113c:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    113e:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    1140:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    1142:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    1144:	|  |  |  |               tst.w d0
    1146:	|  |  |  |           /-- bne.s 114c <_doynaxdepack_asm+0x48>
    1148:	|  |  |  |           |   move.w (a0)+,d0
    114a:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    114c:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    114e:	|  |  |  |  /----------- beq.s 1166 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    1150:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    1152:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    1154:	|  |  |  |  |  /-------- bpl.s 1162 <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    1156:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    1158:	|  |  |  |  |  |  /----- bpl.s 1160 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    115a:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    115c:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    115e:	|  |  |  |  |  |  |  \-- bmi.s 115a <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    1160:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    1162:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    1164:	|  |  |  |  |        /-- bcc.s 1168 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    1166:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    1168:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    116a:	|  |  |  |  \----------- dbf d1,1166 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    116e:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    1170:	|  |  |  \-------------- bcc.s 1120 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    1172:	|  |  |                  tst.w d0
    1174:	|  +--|----------------- bne.s 117a <_doynaxdepack_asm+0x76>
    1176:	|  |  |                  move.w (a0)+,d0
    1178:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    117a:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    117c:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    117e:	|     \----------------- bcc.s 111e <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    1180:	|                 /----- bpl.s 1188 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    1182:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    1184:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    1186:	|                 |  \-- bmi.s 1182 <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    1188:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    118a:	\--------------------/-X dbv.s d1,1112 <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    118e:	                     |   add.l d0,d0
	eor.w	d1,d0		
    1190:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    1192:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    1194:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    1196:	                     \-- bra.s 118a <_doynaxdepack_asm+0x86>

00001198 <doy_table>:
    1198:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    11a8:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    11b8:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    11c8:	.............o
