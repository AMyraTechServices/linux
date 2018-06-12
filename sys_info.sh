#!/bin/bash
#written by Gren Pinto 22/2/2014
if [ "$USER" = "root" ]; then
touch /tmp/sys_info.out
cat /dev/null>/tmp/sys_info.out
echo '====START===='>/tmp/sys_info.out
date >> /tmp/sys_info.out
echo '=============================================='>> /tmp/sys_info.out
echo 'displaying system info: cmd=lshw -short -class'>> /tmp/sys_info.out
echo '=============================================='>> /tmp/sys_info.out
lshw -short -class system>> /tmp/sys_info.out
echo '=============================================================================================='>> /tmp/sys_info.out

echo '======================'>> /tmp/sys_info.out
echo 'showing processor info'>> /tmp/sys_info.out
echo '======================'>> /tmp/sys_info.out
lshw -short -class processor>> /tmp/sys_info.out
echo '=============================================================================================='>> /tmp/sys_info.out

echo '==========================================='>> /tmp/sys_info.out
echo 'showing BIOS mem,L1/2 cache,system mem info'>> /tmp/sys_info.out
echo '==========================================='>> /tmp/sys_info.out
lshw -short -class memory>> /tmp/sys_info.out
echo '=============================================================================================='>> /tmp/sys_info.out


echo '==================================='>> /tmp/sys_info.out
echo 'showing storage disk and partitions'>> /tmp/sys_info.out
echo '==================================='>> /tmp/sys_info.out
lsblk >> /tmp/sys_info.out
lshw -short -C disk>> /tmp/sys_info.out
lshw -short -class storage>> /tmp/sys_info.out
lshw -short -class volume>> /tmp/sys_info.out
echo 'output written to /tmp/sys_infp.out'
echo '====END===='>> /tmp/sys_info.out
cat /tmp/sys_info.out
else
echo 'WARNING:!!!execute as root!!!'
fi
