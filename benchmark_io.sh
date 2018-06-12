#!/bin/bash
if [ "$USER" = "root" ]; then
mkdir /tmp/bench/
touch /tmp/bench/diskbench
echo 'CHECKING WRITE PERFORMANCE: You’ll want this to be above 40 MB/s'
echo '================================================================='
dd if=/dev/zero of=/tmp/bench/diskbench bs=1M count=1024 conv=fdatasync

echo 'CHECKING READ PERFORMANCE:deleting buffer cache in order to measure ‘read’ speed'
echo '================================================================================'
echo 3 > /proc/sys/vm/drop_caches

dd if=/tmp/bench/diskbench of=/dev/null bs=1M count=1024

echo 'checking with buffer cache'
echo '=========================='
dd if=/tmp/bench/diskbench of=/dev/null bs=1M count=1024

sudo rm -rf /tmp/bench/

else
echo 'WARNING:!!!PLEASE EXECUTE AS ROOT USER'
fi
