#!/usr/bin/bash

user=$(cat userdetails.csv)

for i in $user
do
	if id $i &> /dev/null
	then
		echo "User '$i' already exists"
	else
		if useradd $i
		then
			echo "user '$i' created successfully..."
		else
			echo "user $i not created"
		fi
	fi
done
