#include "s3c2440_soc.h"

void delay(int d)
{
	while(d--);
}

int main(void)
{
    int val = 0;

    /* ���� GPFCON �� GPF4/5/6 ����Ϊ������� */
	GPFCON &= ~((3 << 8) | (3 << 10) | (3 << 12)); /* �� 0 */
	GPFCON |= ((1 << 8) | (1 << 10) | (1 << 12)); /* ������� */

    /* ѭ������ */
    while (1) {
        GPFDAT &= ~(7 << 4);
        GPFDAT |= ((~val & 7) << 4);
        delay(100000);
        val ++;
        val %= 8;
    }

    return 0;
}

