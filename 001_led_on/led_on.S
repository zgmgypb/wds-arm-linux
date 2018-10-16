/*
* 点亮 LED: gpf4
*/
.text
.global _start

_start:
/* 配置GPF4 为输出引脚 
* 把 0x100 写到地址 0x56000050
*/
	ldr r1, =0x56000050
	ldr r0, =0x100 /* mov r0, #0x100 */
	str r0, [r1]

/* 设置 GPF4 输出高电平 
* 把 0x0 写到地址 0x56000054
*/
	ldr r1, =0x56000054
	ldr r0, =0x0 /* mov r0, #0x0 */
	str r0, [r1]

/* 死循环 */
halt:
	b halt
