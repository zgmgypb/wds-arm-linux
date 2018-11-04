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

    /* ���ð�����Ӧ������Ϊ���빦�� */
	GPGCON &= (3 << 8); /* �� 0 */

    /* ѭ������ */
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

