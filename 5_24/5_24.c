#include <stdio.h>

int main()
{
    /*int i=0;
    while(i<10){
        printf("Hello World\n");
        i++;
    }*/

    int i=0;
    loop:
        if(10<=i){
            goto exit_loop;
        }
        printf("i=%d\n",i);
        i++;
        goto loop;
    exit_loop:
        return 0;
}
