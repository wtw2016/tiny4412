.text
.globl _start
_start:
	// 1.close watchdog
	ldr r0,=0x10060000
	mov r1, #0
	str r1, [r0]

	// 2. icache
	mrc p15, 0, r0, c1, c0, 0
	orr r0, r0, #0x00001000 // open iCache 
	//bic r0, r0, #0x00001000 // close iCache 
	mcr p15, 0, r0, c1, c0, 0

	/* set stack pointer at 0x02027800
	   sp = the address of iRAM base(0x02020000) +
	        iROM Code(5K) +
	        BL1 Code(8K) +
	        BL2 Code(16K) +
	        Stack(1K) = 0x02027800
	*/
	ldr sp,=0x02027800

	bl main

halt_loop:
	b halt_loop

