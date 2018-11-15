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

    /* 循环点亮 */
    while (1) {
        GPFDAT &= ~(7 << 4);
        GPFDAT |= ((~val & 7) << 4);
        delay(100000);
        val ++;
        val %= 8;
    }

    return 0;
}

