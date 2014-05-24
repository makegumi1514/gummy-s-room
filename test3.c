#include <stdio.h>
int main()
{
    int x,y,z;
    for(x=0;x<10;x++){
        for(y=0;y<10;y++){
            z=x*y;
            printf("z=%d\n",z);
        }
    }
    return 0;
}