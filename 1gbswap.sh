#!/bin/bash

#Determine the size of the new swap file in megabytes and multiply by 1024 to determine the number of blocks. 
#For example, the block size of a 1024 MB swap file is 1048576.
#At a shell prompt as root, type the following command with count being equal to the desired 
#block size:
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576

#Setup the swap file with the command:
sudo mkswap /swapfile

#To enable the swap file immediately but not automatically at boot time:
sudo swapon /swapfile

#To enable it at boot time, edit /etc/fstab to include the following entry:
sudo echo "#gp" >> /etc/fstab
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

