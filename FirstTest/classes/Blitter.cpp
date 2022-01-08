#include "../support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/graphics.h>
#include "Blitter.h"

Blitable::Blitable() {
    custom = (struct Custom*)0xdff000;
}

BlitterControl* BlitterControl::instance(){
    if (BlitterControl::singleton==NULL) {
        BlitterControl::singleton=new BlitterControl;
    }
    return BlitterControl::singleton;
}

void BlitterControl::destroy() {
    if (BlitterControl::singleton!=NULL) {
        delete BlitterControl::singleton;
    }
}


BlitterControl::BlitterControl() {
    custom = (struct Custom*)0xdff000;
    OwnBlitter();
}

BlitterControl::~BlitterControl() {
    custom = (struct Custom*)0xdff000;
    DisownBlitter();
}

bool BlitterControl::isScheduled(Blitable *blit) {
    if (blit->prev!=NULL || currentBlit==blit) {
        return true;
    } else {
        return false;
    }
}

void BlitterControl::schedule(Blitable* blit){
    if (!isScheduled(blit)) {
        if (hasMoreScheduled()) {
            blit->prev=lastScheduledBlitable;
            lastScheduledBlitable->next=blit;
            lastScheduledBlitable=blit;
        } else {
            lastScheduledBlitable=blit;
            currentBlit=blit;
            currentBlit->blit();
        } 
    }
}

void BlitterControl::check() {
    if (!isBlittingInProgress() && hasMoreScheduled() ) {
        startNextBlit();
    } else if (isBlittingInProgress()) {
        KPrintF("blitter busy\n");
    }
}

bool BlitterControl::hasMoreScheduled() {
    if (lastScheduledBlitable==NULL) {
        return false;
    } else {
        return true;
    }
}

bool BlitterControl::isBlittingInProgress() {
    // readtwice cause of agnus bug on older machines
    return (custom->dmaconr&DMAF_BLTDONE | custom->dmaconr&DMAF_BLTDONE);
}

void BlitterControl::startNextBlit() {
    currentBlit=currentBlit->next;
    if (currentBlit!=NULL) {
        currentBlit->prev=NULL;
        currentBlit->blit();
    } else {
        lastScheduledBlitable=NULL;
    }
}