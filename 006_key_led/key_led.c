#include "s3c2440_soc.h"

void delay(int d)
{
	while(d--);
}

int main(void)
{
    int val = 0;

    /* 设置 GPFCON 让 GPF4/5/6 配置为输出引脚 */
	GPFCON &= ~((3 << 8) | (3 << 10) | (3 << 12)); /* 清 0 */
	GPFCON |= ((1 << 8) | (1 << 10) | (1 << 12)); /* 设置输出 */

    /* 设置按键对应的引脚为输入功能 */
	GPGCON &= (3 << 8); /* 清 0 */

    /* 循环点亮 */
    while (1) {
        if (GPFDAT & (1 << 0))
          GPFDAT |= (1 << 4);
        else 
          GPFDAT &= ~(1 << 4);

        if (GPFDAT & (1 << 2))
          GPFDAT |= (1 << 5);
        else 
          GPFDAT &= ~(1 << 5);

        if (GPGDAT & (1 << 3))
          GPFDAT |= (1 << 6);
        else 
          GPFDAT &= ~(1 << 6);
    }

    return 0;
}

