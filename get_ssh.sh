#!/bin/bash
if [ "$USER" = "root" ]; then
	echo getting the required package to establish ssh connection
	apt-get install openssh-server openssh-client
	netstat --listening |grep -i ssh
 	echo ssh is now enabled on intranet
else
	echo please execute as root user
fi
