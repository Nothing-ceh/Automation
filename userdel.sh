#/bin/bash

#User Delete with help of bash scripting 

#fist we need to set variables 

echo "What is the user name which you want to delete"

read user

sudo userdel $user

echo "User delete successfully"
echo 

tail -n 3 /etc/passwd
