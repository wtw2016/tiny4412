objs := start.o main.o sys_clk_init.o
led.bin : $(objs)
	arm-linux-ld -Tled.lds -N -o led.elf $^
	arm-linux-objcopy -O binary -S led.elf $@
	arm-linux-objdump -D -m arm led.elf > led.dis

%.o : %.c
	arm-linux-gcc -Wall -marm -c -O2 -o $@ $<

%.o : %.S
	arm-linux-gcc -Wall -marm -c -O2 -o $@ $<

clean:
	rm -f *.dis *.bin *.elf *.o
