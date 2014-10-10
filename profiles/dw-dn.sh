. profiles/common/base.sh

net eth0 current

part sdc 1 fd00 32G
part sdc 2 a504

part sdd 1 fd00 32G
part sdd 2 a504

mdraid md1 --level=1 --raid-devices=2 /dev/sdc1 /dev/sdd1

format /dev/md1 ext4

mountfs /dev/md1 ext4 /
