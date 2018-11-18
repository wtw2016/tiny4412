#define CLK_SRC_CPU    (*(volatile unsigned int *)0x10044200)
#define APLL_LOCK      (*(volatile unsigned int *)0x1004109c)
#define CLK_DIV_CPU0   (*(volatile unsigned int *)0x10044500)
#define CLK_DIV_CPU1   (*(volatile unsigned int *)0x10044504)
#define APLL_CON0      (*(volatile unsigned int *)0x10044100)
#define APLL_CON1      (*(volatile unsigned int *)0x10044104)

void sys_clk_init_cpu_24M(void) {
	/*
	 * 1.disable APLL
	 * 2.24MHZ
	 *
	 * */
	CLK_SRC_CPU = 0x0;
}

void sys_clk_init_cpu_1_4G(void) {
	CLK_SRC_CPU = 0x0;

	// set PLL lock time for APLL, APLL_CON0 PDIV = 3, so LOCK_TIME = 270 * 3
	APLL_LOCK = 270 * 3;

	/* set param
	 * * CORE2_RATIO = 0;
	 * * APLL_RATIO = 2;
	 * * PCLK_DBG_RATIO = 1;
	 * * ATB_RATIO = 6;
	 * * PERIPH_RATIO = 7;
	 * * COREM1_RATIO = 7;
	 * * COREM0_RATIO = 3;
	 * * CORE_RATIO = 0;
	 * */
	CLK_DIV_CPU0 = ((0<<28) | (2<<24) | (1<<20) | (6<<16) | (7<<12) | (7<<8) | (3<<4) | 0);

	/*
 	* * CORES_RATIO = 5;
 	* * HPM_RATIO = 0;
 	* * COPY_RATIO = 6;
 	* */
	CLK_DIV_CPU1 = ((5 << 8) |(0 << 4) | (6));
	
	// set control param
	APLL_CON1 = 0x00803800;

	APLL_CON0 = (1<<31 | 0xAF<<16 | 3<<8 | 0x0);

	CLK_SRC_CPU = 0x01000001;
}
