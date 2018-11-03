/*
* 点亮 LED: gpf4
*/
.text
.global _start

_start:
/* 配置GPF4\GPF5\GPF6 为输出引脚 
* 把 0x1500 写到地址 0x56000050
*/
	ldr r1, =0x56000050
	ldr r0, =0x1500 /* mov r0, #0x1500 */
	str r0, [r1]

/* 设置 GPF4\GPF5\GPF6 输出低电平 
* 把 0x0 写到地址 0x56000054
*/
	ldr r1, =0x56000054
	ldr r0, =0x0 /* mov r0, #0x0 */
	str r0, [r1]

/* 死循环 */
halt:
	b halt
