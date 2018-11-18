#define GPM4CON (*(volatile unsigned int *)0x110002E0)
#define GPM4DAT (*(volatile unsigned int *)0x110002E4)

void delay(volatile int time) {
	while (time > 0) time--;
}

int main(void) {
	unsigned int tmp = 0;
	int data = 0;

	tmp = GPM4CON;
	tmp &= ~0xffff;
	tmp |= 0x1111;
	GPM4CON = tmp;

	while (1) {
		GPM4DAT = 0xf;
		delay(9999999);
		GPM4DAT = 0x0;
		delay(9999999);
	}

	return 0;
}
