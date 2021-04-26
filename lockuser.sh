#!/usr/bin/bash

timeStamp=$(date +%F)

while :
do
	read -p "Input the username to lock and perform the backup: " user
	if [-Z $user]
	then
		echo "invalid input please provide username; username is not provided"
	else
		if id $user &> /dev/null
		then
			passwd -l $user
			homeDir=$(grep ^${user}: /etc/passwd | cut -d ":" -f6)
			echo $homeDir
			if [ -d $homeDir ]
			then
				echo "Home directory exixts"
				tar -cf ${user}-${timeStamp}.tar $homeDir
			fi
			exit 0
		else
			echo "provided user doesnot exist"
		fi
	fi
done
