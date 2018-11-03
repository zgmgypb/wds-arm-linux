
void delay(int d)
{
	while(d--);
}

int led_on(int which)
{
	*(int *)0x56000050 = (1 << (which << 1));
	*(int *)0x56000054 = 0x0;
}

