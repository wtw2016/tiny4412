if [ -z $1 ]
then
	echo "Usage: update.sh <xxx.bin>"
	exit 0
fi

mkbl2 $1 bl2.bin 14336
sudo dd iflag=dsync oflag=dsync if=/home/book/work/tiny4412/source/uboot_tiny4412/sd_fuse/tiny4412/E4412_N.bl1.bin of=/dev/sdc seek=1
sudo dd iflag=dsync oflag=dsync if=./bl2.bin of=/dev/sdc seek=17
sync
