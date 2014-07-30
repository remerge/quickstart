. profiles/common/base.sh

part sdc 1 fd00
part sdd 1 fd00

mdraid md1 --level=1 --raid-devices=2 /dev/sdc1 /dev/sdd1

format /dev/md1 ext4

mountfs /dev/md1 ext4 /
