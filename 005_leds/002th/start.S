.text
.global _start

_start:
	/* 关闭看门狗 */	
	ldr r0, =0x53000000
	ldr r1, =0
	str r1, [r0]

	/* 设置内存: sp 栈 
     * nand 启动时: 0 地址对应片内内存
     * nor 启动时: 0 地址对应 nor flash, nor flash 理解为像硬盘，硬盘是可以像内存一样读，但不能像内存一样写
     * 分辨是 nor/nand 启动
     * 写 0 到 0 地址，再读出来, 如果得到 0，表示 0 地址上的内容被修改了，它对应的是 ram，这就是 nand 启动，否则就是 nor 启动
     */
    mov r1, #0
    ldr r0, [r1] /* 读出原来的值备份一下 */
    str r1, [r1] /* 0->[0] */
    ldr r2, [r1] /* r2=[0] */
    cmp r1, r2
	ldr sp, =0x40000000 + 4096 /* 先假设是 nor 启动 */
    moveq sp, #4096 /* r1==r2? 如果相等表明是 nand 启动 */
    streq r0, [r1] /* 恢复原来的值 */

	bl main

halt:
	b halt
