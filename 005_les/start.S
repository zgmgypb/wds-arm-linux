.text
.global _start

_start:
	/* 设置内存: sp 栈 */
	ldr sp, = 4096 /* nand 启动 */
	//ldr sp, = 0x40000000 + 4096 /* nor 启动 */

halt:
	mov r0, #4
	bl led_on	

	ldr r0, =100000
	bl delay
	/* 调用 led_on 函数 */
	mov r0, #5
	bl led_on

	ldr r0, =100000
	bl delay

	b halt
