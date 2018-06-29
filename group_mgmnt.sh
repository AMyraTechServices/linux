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
		main;
	fi
}

checkLogfile() {

cd /var/tmp
if [ -f user_mgmnt.out ]; then

        touch grp_mgmnt.out
        echo modified by user $USER on date:>>user_mgmnt.out
        date>>grp_mgmnt.out
else
        echo modified by user $USER on date:>>user_mgmnt.out
        date>>grp_mgmnt.out
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
		echo groupadd $gadd
		groupadd $gadd>>grp_mgmnt.out
		checkCont;

	elif [ "$option" = "d" ]; then
		echo -n enter the group to be deleted: 
		read gdel
		groupdel $gdel
		groupdel $gdel>>grp_mgmnt.out
		echo groupdel $gdel
		checkCont;
	
	elif [ "$option" = "m" ]; then
		echo -n enter group to be modified as:  
		read gmod_old
		echo -n enter new name for the group : 
		read gmod_new	
		groupmod -n $gmod_new $gmod_old
		groupmod -n $gmod_new $gmod_old>>grp_mgmnt.out
		echo groupmod -n $gmod_new $gmod_old

		checkCont;

	elif [ "$option" = "l" ]; then
		echo -n enter group to check or hit enter to list :
		read glis
		if [ ! $glis ]; then
			cat /etc/group
		else
			cat /etc/group| grep -i $glis
			echo cat /etc/group| grep -i $glis
			cat /etc/group| grep -i $glis>>grp_mgmnt.out
		fi
		checkCont;
	else
		echo enter valid option and continue
	fi

}

checkRootUser;
checkBash;
checkLogfile;
main;
