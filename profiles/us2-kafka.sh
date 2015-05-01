. profiles/common/base.sh

net eth0 current

part sda 1 fd00
part sdb 1 fd00
part sdc 1 fd00
part sdd 1 fd00

mdraid md1 --level=10 --raid-devices=4 /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1

format /dev/md1 ext4

mountfs /dev/md1 ext4 /
