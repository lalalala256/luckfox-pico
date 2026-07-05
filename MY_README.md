# 刷uboot.img
dd if=/tmp/uboot.img of=/dev/mmcblk1p3 bs=4K conv=fsync
dd if=uboot.img of=/dev/mmcblk1p3 bs=4K conv=fsync

# 刷boot.img
dd if=/tmp/boot.img of=/dev/mmcblk1p4 bs=4K conv=fsync
dd if=boot.img of=/dev/mmcblk1p4 bs=4K conv=fsync

# 查看gpio状态和方向
sudo cat /sys/kernel/debug/gpio | grep gpio-57
cat /sys/class/gpio/gpio57/direction   # 输出 in 或 out
cat /sys/class/gpio/gpio57/value       # 输出 0 或 1
sudo gpioinfo

# mmc的分区，可以查看/proc/cmdline和lsblk来分析。/dev/mmcblk1p3是uboot.img，/dev/mmcblk1p4是boot.img

# 使用framebuffer后，使用以下命令可以接入触摸指令
sudo evtest /dev/input/event1
# 使用以下指令测试framebuffer，预期显示满屏雪花点
su root
cat /dev/urandom > /dev/fb0