#/bin/bash

#Create user in linux via bash script 

echo "What is  user Name:";
read name
sudo useradd $name
sleep 1
echo "Your $name user created  successfully "
sleep 1

sudo passwd $name
echo "Welcome to your team $name"
echo 
#Now verify user in /etc/passwd
sleep 1
echo 
tail /etc/passwd | grep $name

