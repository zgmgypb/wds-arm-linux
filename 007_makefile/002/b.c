#include <stdio.h>

extern int func_c();
int func_b(void)
{
    return func_c();
}
