#Knowledge Base:Continuing after an interrupted installation
#https://wiki.gentoo.org/wiki/Knowledge_Base:Continuing_after_an_interrupted_installation

#If "Preparing the disks" was not finished 
#Chapter 4 ("Preparing the disks") must be completed before it is possible for changes to 
#persist on the drives. If the disks have been partitioned but do on to have any file system
#on them, then continue from that step. There is no need to re-partition the disks if the
#work has been done. 
#And then
#remount the partitions: 
swapon /dev/sda2
mount /dev/sda3 /mnt/gentoo
#mkdir /mnt/gentoo/boot
mount /dev/sda1 /mnt/gentoo/boot

#Getting the chroot ready - all changes made in a chrooted environment will be persistent changes. 
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
chroot /mnt/gentoo /bin/bash
env-update
source /etc/profile 
