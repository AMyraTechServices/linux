#!/bin/sh
#Nethogs is a small 'net top' tool that shows the bandwidth used by individual processes 
#and sorts the list putting the most intensive processes on top. 
#In the event of a sudden bandwidth spike, quickly open nethogs and find the process responsible. 
#Nethogs reports the PID, user and the path of the program.
#Tcptrack is similar to iftop, and uses the pcap library to capture packets and calculate various statistics 
#like the bandwidth used in each connection. 
#It also supports the standard pcap filters that can be used to monitor specific connections.

echo 'GETTING NETWORK INFO FOR YOUR SYSTEM'
echo '====================================='
#if [ package already installed ]
#then
#   echo "package is already installed"
#else
   sudo apt-get install nethogs
   sudo apt-get install tcptrack
   sudo nethogs
   sudo tcptrack
#fi

echo 'GETTING IOPS FOR YOUR SYSTEM'
echo '============================'

#if [ package already installed ]
#then
#   echo "package is already installed"
#else
   sudo apt-get install sysstat
   sudo iostat -dx
#fi

echo 'GETTING MEMORY USAGE FOR YOUR SYSTEM'
echo '===================================='
sudo free -m


echo 'GETTING CPU USAGE FOR YOUR SYSTEM'
echo '===================================='
sudo mpstat -P ALL
sudo iostat
top
Q


