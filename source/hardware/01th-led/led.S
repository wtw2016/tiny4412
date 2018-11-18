.text
.globl _start
_start:
 
/*
* set GPM4 as output
*/
ldr r0, =0x110002E0 // GPM4CON�ĵ�ַ��0x110002E0
ldr r1, [r0] // �ȶ���ԭֵ
bic r1, r1, #0xff00 // ���bit[15:8]
bic r1, r1, #0xff // ���bit[7:0]
orr r1, r1, #0x1100 // ����bit[15:8]Ϊ0b00010001
orr r1, r1, #0x11 // ����bit[7:0]Ϊ0b00010001
str r1, [r0] // д��GPM4CON
/*
* set GPM4DAT as Low For leds
*/
ldr r0, =0x110002E4 // GPM4DAT�ĵ�ַ��0x110002E0
ldr r1, [r0] // ����ԭֵ
 
leds_loop:
 
bic r1, r1, #0xf // ���bit[0-3]Ϊ0 ȫ��
str r1, [r0] // д��GPM4DAT
ldr r2,=0xffffff
bl delay
/*
orr r1, r1, #0xe // ����bit[0]Ϊ0 LED1��
str r1, [r0] // д��GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0x3 // ����bit[1]Ϊ0 LED2��
orr r1, r1, #1
str r1, [r0] // д��GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0x6 // ����bit[2]Ϊ0 LED3��
orr r1, r1, #2
str r1, [r0] // д��GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0xc // ����bit[3]Ϊ0 LED4��
orr r1, r1, #4
str r1, [r0] // д��GPM4DAT
ldr r2,=0xffffff
bl delay
*/
orr r1, r1, #0xf
str r1, [r0] // д��GPM4DAT ȫ��
ldr r2,=0xffffff
bl delay
 
b leds_loop
halt_loop:
b halt_loop
 
delay:
//��������ʱ����
sub r2,r2,#1 //sub ����
cmp r2,#0x0 //��r0 ��0�Ƚ�
bne delay //b���� ne �ǲ���� ������Ⱦ�����delay
mov pc,lr //lr �����ǵ��ú���ʱ����һ��ָ���Pcָ��ָ��lr�Ϳ�����ɺ����ķ���