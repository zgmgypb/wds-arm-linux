.text
.global _start

_start:
	/* 关闭看门狗 */	
	ldr r0, =0x53000000
	ldr r1, =0
	str r1, [r0]

    /* 设置 MPLL, FCLK:HCLK:PCLK = 400M:100M:50M */
    ldr r0, =0x4c000000
    ldr r1, =0xFFFFFFFF
    str r1, [r0]
    ldr r0, =0x4c000014
    ldr r1, =0x5
    str r1, [r0]

    /* 设置 CPU 工作在异步模式 */
    mrc p15,0,r0,c1,c0,0
    orr r0,r0,#0xC0000000 // #R1_nF:OR:R1_iA
    mcr p15,0,r0,c1,c0,0

    /* 设置 MPLL = (92 << 8) | (1 << 4) + (1)
     * m = MDIV + 8 = 92 + 8 = 100
     * p = PDIV + 1 = 1 + 2 = 3 
     * s = SDIV = 1 
     * FCLK = 2 * m * Fin / (p * 2^s) = 2 * 100 * 12 / (3 * 2) = 400M
     */
    ldr r0, =0x4c000004
    ldr r1, =(92 << 12) | (1 << 4) | (1 << 0)
    str r1, [r0]

    /* 一旦设置 PLL, 就会锁定 local time 直到 PLL 输出稳定
     * 然后 CPU 工作于新的频率 FCLK
     */
    

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
