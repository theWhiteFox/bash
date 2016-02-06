#!/bin/bash
#this program will display the following info

#Home directory 
#Current directory
#Terminal type and 
#Services started

#MAIN PROGRAM 

#clear user terminal and echo program scope
clear
echo "Hello $USER. I am Benzene. The server AI. "
#echo the program data
echo "Your home Directory is $HOME."
echo "Your Current Directory is $(pwd)"  
echo "Your Terminal type is $TERM "
echo "Current services are :\n"
ls /etc/rc3.d/S*
#end the program 
echo "Press any key to exit the Program."
read endofprogram



