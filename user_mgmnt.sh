#!/bin/bash
#written by Gren Pinto 2/7/2015
#email grenwell@gmail.com
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

        touch user_mgmnt.out
	echo modified by user $USER on date:>>user_mgmnt.out
	date>>user_mgmnt.out
else
	echo modified by user $USER on date:>>user_mgmnt.out
	date>>user_mgmnt.out
fi

}

main() {

	echo -n 
	echo please enter from below options:
	echo 'a' to add user: 
	echo 'd' to delete user:
	echo 'm' modify user group: 
	read option

	if [ "$option" = "a" ]; then
		echo -n enter username to be added: 
		read uname
		useradd -m -d /home/$uname -c '"'$uname'"' $uname
		echo useradd -m -d /home/$uname -c '"'$uname'"' $uname
		echo useradd -m -d /home/$uname -c '"'$uname'"' $uname>>/var/tmp/user_mgmnt.out
		checkCont;

	elif [ "$option" = "d" ]; then
		echo -n enter username to be deleted: 
		read unmdel
		userdel -r $unmdel
		echo userdel -r $unmdel
                echo userdel -r $unmdel>>/var/tmp/user_mgmnt.out
		checkCont;

	elif [ "$option" = "m" ]; then
		echo -n username to be modified; 
		read unamemod


		echo -n enter group to be added to; 
		read ugrpmod


		echo listing old groups for user $unamemod
		echo --------------------------------------
		grep -i $unamemod /etc/group


		echo listing old members of the group $ugrpmod
		echo ------------------------------------------
		grep -i $ugrpmod /etc/group


		usermod -a -G $ugrpmod $unamemod
                echo usermod -a -G $ugrpmod $unamemod
                echo usermod -a -G $ugrpmod $unamemod>>/var/tmp/user_mgmnt.out


		echo user $unamemod is now a part of $ugrpmod group
		checkCont;

	else
		echo enter valid option and continue
	fi
}


checkRootUser;
checkBash;
checkLogfile;
main;
