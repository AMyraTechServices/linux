#!/bin/bash
#written by Gren Pinto 22/2/2014
#Nethogs is a small 'net top' tool that shows the bandwidth used by individual processes 
#and sorts the list putting the most intensive processes on top. 
#In the event of a sudden bandwidth spike, quickly open nethogs and find the process responsible. 
#Nethogs reports the PID, user and the path of the program.
#Tcptrack is similar to iftop, and uses the pcap library to capture packets and calculate various statistics 
#like the bandwidth used in each connection. 
#It also supports the standard pcap filters that can be used to monitor specific connections.
#echo 'GETTING NETWORK INFO FOR YOUR SYSTEM'
#echo '====================================='
#if [ package already installed ]
#then
#   echo "package is already installed"
#else
#   sudo apt-get install nethogs
#   sudo apt-get install tcptrack
#   sudo nethogs
#  sudo tcptrack
#fi

cd /var/tmp
if [ -f sys_stat.out ]; then

	touch sys_stat.out
fi

if [ "$USER" = "root" ]; then
	echo 'Running check'
	cd /var/tmp
	echo 'checking required package'
	echo '========================='
	   	apt-get install sysstat>>/dev/null
	echo '==============================================================================='>>sys_stat.out
	echo '==============================================================================='>>sys_stat.out
	date>>sys_stat.out
	echo '==============================================================================='>>sys_stat.out
	echo '==============================================================================='>>sys_stat.out
	echo 'displaying load average for your system'>>sys_stat.out
	echo '======================================='>>sys_stat.out
		uptime>>sys_stat.out

	echo 'GETTING IOPS FOR YOUR SYSTEM'>>sys_stat.out
	echo '============================'>>sys_stat.out
	   	iostat -dmp -j LABEL>>sys_stat.out

	echo 'GETTING MEMORY USAGE FOR YOUR SYSTEM'>>sys_stat.out
	echo '===================================='>>sys_stat.out
		free -m>>sys_stat.out

	echo 'GETTING CPU USAGE FOR YOUR SYSTEM'>>sys_stat.out
	echo '===================================='>>sys_stat.out
		mpstat -P ALL>>sys_stat.out
	echo 'displaying last 100 lines of output from /var/tmp/sys_stat.out'	
	tail -100 /var/tmp/sys_stat.out
else
	echo 'warning:execute as root!!!!'
fi

