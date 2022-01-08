#include <proto/graphics.h>
#include <hardware/custom.h>


class Mouse {

    volatile UBYTE *ciaa_pra = (volatile UBYTE *) 0xbfe001;
    #define PRA_FIR0_BIT (1 << 6) 

    public:
        void waitLMB() {
            while ((*ciaa_pra & PRA_FIR0_BIT)!=0);
        }

};


