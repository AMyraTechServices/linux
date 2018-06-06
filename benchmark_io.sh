#!/bin/bash
cd
sudo mkdir /home/bench/
cd /home/bench/

echo 'CHECKING WRITE PERFORMANCE: You’ll want this to be above 400 MB/s'
echo '================================================================='
sudo dd if=/dev/zero of=diskbench bs=1M count=1024 conv=fdatasync


echo 'CHECKING READ PERFORMANCE:deleting buffer cache in order to measure ‘read’ speed'
echo '================================================================================'
echo 3 | sudo tee /proc/sys/vm/drop_caches
dd if=diskbench of=/dev/null bs=1M count=1024

echo 'checking with buffer cache'
echo '=========================='
dd if=diskbench of=/dev/null bs=1M count=1024

echo 'RUN THIS AT DIFFERENT TIMES TO CALCULATE THE AVG'

sudo rm -rf /home/bench/

