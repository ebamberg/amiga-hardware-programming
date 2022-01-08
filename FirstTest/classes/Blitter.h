#pragma once

#include <proto/exec.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>

class Blitable {
    friend class BlitterControl;  
    Blitable* next=NULL;
    Blitable* prev=NULL;

    virtual void blit() = 0; 

    public:
     volatile struct Custom *custom;
     Blitable();
};

class BlitterControl {

    inline static BlitterControl *singleton;

    Blitable* currentBlit=NULL;
    Blitable* lastScheduledBlitable=NULL;

    private:
        void startNextBlit();
        bool hasMoreScheduled();
        bool isScheduled(Blitable *blit);
        volatile struct Custom *custom;
        BlitterControl();
        ~BlitterControl();

    public:
        static BlitterControl* instance();
        static void destroy();
        void schedule(Blitable* blit);
        void check();
        bool isBlittingInProgress();

};
