
int main(void)
{
	*(int *)0x56000050 = 0x400;
	*(int *)0x56000054 = 0x0;

	return 0;
}
