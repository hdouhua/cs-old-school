#include <stdio.h>
#include "add_lib.h"
// or
// extern int add(int a, int b);

int main()
{
    int a = 10;
    int b = 5;
    int c = add(a, b);
    printf("c = %d\n", c);
}
