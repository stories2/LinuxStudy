#!/bin/bash
userStartNumber=101
userCreateNum=9
userId=0
userCreateCounter=0
userCreateLastNumber=$(($userStartNumber + $userCreateNum - 1))
echo "create user $userStartNumber ~ $userCreateLastNumber"

#eval "sudo su"

while [ $userCreateCounter -lt $userCreateNum ]
do
	userId=`expr $userStartNumber + $userCreateCounter`
	userCreateCounter=`expr $userCreateCounter + 1`
	echo "we will create user id : unix$userId"

	eval "sudo useradd unix$userId -m && echo unix$userId:unix$userId | chpasswd --crypt-method=SHA512"
	#eval "sudo userdel -r unix$userId"
done
