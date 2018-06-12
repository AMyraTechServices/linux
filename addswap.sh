#!/bin/sh
#script by Grenwell Pinto 31 Jan 2012
set -x
if [ "$USER" = "root" ]; then
	cd /dev
	if [ ! -d "swap" ]; then
		mkdir swap
	fi
	cd swap
	read -p "Enter the amount of swap space to be added in GB eg:2 " tot_val
	set tot_space = "$((1024 * 1024 * $tot_val))"
	echo $tot_space
	dd if=/dev/zero of=swapfile bs=1024 count=$tot_space
	mkswap swapfile
	#sudo echo "#gp" >> /etc/fstab
	#sudo echo "/dev/swap/swapfile swap swap defaults 0 0" >> /etc/fstab	
else
	echo 'warning!!!please execute as root!!!'
fi
