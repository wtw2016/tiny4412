.text
.globl _start
_start:
 
/*
* set GPM4 as output
*/
ldr r0, =0x110002E0 // GPM4CON的地址是0x110002E0
ldr r1, [r0] // 先读出原值
bic r1, r1, #0xff00 // 清除bit[15:8]
bic r1, r1, #0xff // 清除bit[7:0]
orr r1, r1, #0x1100 // 设置bit[15:8]为0b00010001
orr r1, r1, #0x11 // 设置bit[7:0]为0b00010001
str r1, [r0] // 写入GPM4CON
/*
* set GPM4DAT as Low For leds
*/
ldr r0, =0x110002E4 // GPM4DAT的地址是0x110002E0
ldr r1, [r0] // 读出原值
 
leds_loop:
 
bic r1, r1, #0xf // 清除bit[0-3]为0 全亮
str r1, [r0] // 写入GPM4DAT
ldr r2,=0xffffff
bl delay
/*
orr r1, r1, #0xe // 设置bit[0]为0 LED1亮
str r1, [r0] // 写入GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0x3 // 设置bit[1]为0 LED2亮
orr r1, r1, #1
str r1, [r0] // 写入GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0x6 // 设置bit[2]为0 LED3亮
orr r1, r1, #2
str r1, [r0] // 写入GPM4DAT
ldr r2,=0xffffff
bl delay
 
bic r1, r1, #0xc // 设置bit[3]为0 LED4亮
orr r1, r1, #4
str r1, [r0] // 写入GPM4DAT
ldr r2,=0xffffff
bl delay
*/
orr r1, r1, #0xf
str r1, [r0] // 写入GPM4DAT 全灭
ldr r2,=0xffffff
bl delay
 
b leds_loop
halt_loop:
b halt_loop
 
delay:
//跑马灯延时程序
sub r2,r2,#1 //sub 减法
cmp r2,#0x0 //将r0 与0比较
bne delay //b是跳 ne 是不相等 ，不相等就跳到delay
mov pc,lr //lr 里存的是调用函数时的下一条指令，让Pc指针指向lr就可以完成函数的返回
