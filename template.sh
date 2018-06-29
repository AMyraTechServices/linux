#!/bin/bash
#created by Gren Pinto
#email grenwell@gmail.com
#
# Check if this utility run as root.
checkRootUser() {
	if [ ${EUID} -ne 0 ]; then
		echo "You need to run as root."
		exit 1
	fi
}

checkBash() {
	if [ -L /bin/sh ]; then
		local sh_link=`readlink -f /bin/sh`
		if ! echo $sh_link | grep -i "bash$" >& /dev/null; then
			echo "/bin/sh is a softlink to $sh_link. The scripts are not compatible with $sh_link shell.  Run the following to change /bin/sh to Bash shell:" | fold -w 80 -s
			echo -e "\tsudo mv /bin/sh /bin/sh.orig"
			echo -e "\tsudo ln -s /bin/bash /bin/sh"
			exit 1
		fi
	fi
}

checkCont() {
	echo -n Do you wish to continue[y/n]? : 
	read cont
	if [ "$cont" = "n" ]; then
		exit 1
	else
		grp_mgmnt;
	fi
}

main() {

	echo 	-n 
	echo	Please enter an option:
	echo	========================== 
	echo	'a' to add new group: 
	echo	'm' to modify group: 
	echo	'd' to delete group:
	echo	'l' to list group: 
	read option

	if [ "$option" = "a" ]; then
		echo -n enter the group to be added: 
		read gadd
		groupadd $gadd
		checkCont;

	elif [ "$option" = "d" ]; then
		echo -n enter the group to be deleted: 
		read gdel
		groupdel $gdel
		checkCont;
	
	elif [ "$option" = "m" ]; then
		echo -n enter group to be modified as: newname oldname-w/o quotes : 
		read gmod
		groupmod -n $gmod
		checkCont;

	elif [ "$option" = "l" ]; then
		echo -n enter group to check or hit enter to list :
		read glis
		if [ ! $glis ]; then
			cat /etc/group
		else
			cat /etc/group| grep -i $glis
		fi
		checkCont;
	else
		echo enter valid option and continue
	fi

}

checkRootUser;
checkBash;
main;
