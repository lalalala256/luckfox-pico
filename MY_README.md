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

# 以引脚GPIO4_C0为例，计算引脚号
在 Luckfox Pico 的 Linux 系统中，操作 GPIO 需要用到它的数字编号。根据官方维基，GPIO 编号的计算方法是：
pin = bank * 32 + (group * 8 + X)
对于 GPIO4_C0：
bank = 4
group = 2 （因为 A=0, B=1, C=2）
X = 0
代入公式：pin = 4 * 32 + (2 * 8 + 0) = 128 + 16 = 144
所以，gpio4_c0 对应的引脚编号是 144

cat /sys/class/gpio/gpio144/direction

# mmc的分区，可以查看/proc/cmdline和lsblk来分析。/dev/mmcblk1p3是uboot.img，/dev/mmcblk1p4是boot.img

# 使用framebuffer后，使用以下命令可以接入触摸指令
sudo evtest /dev/input/event1
# 使用以下指令测试framebuffer，预期显示满屏雪花点
su root
cat /dev/urandom > /dev/fb0