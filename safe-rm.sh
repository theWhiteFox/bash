#!/bin/bash
##########################
#Author : James Gogarty
# Version : 1.0
# Date : 27-08-2014
#This program is a safe alternative to the Linux and Unix rm comand.
#For more informmation on how to use please use the README.TXT file
############################
BIN=RECYCLEBIN
#delete file function
deleteFile ()
{
	echo $@
	# get the inode of the file, which will be added to the filename when moving to the bin
	inode=$(ls -i | grep $1 | cut -d " " -f1)	
	# add the inode number to the file and then move to the bin
	mv  $1 $1_$inode
	mv  $1_$inode $BIN
	echo "the file is now in the bin, and can be forgoten about"
}

filecheck ()
{
# if the file to del ete exits the file will be moved to Bin folder
if [ -f $1 ]
then 
	echo "File : $1 : will now be deleted"
	read -p "Are you sure you wish to delete a file : " confirm
	if [ "$confirm" = "y" ]
	then 
	 
	        deleteFile $@
	else 
		echo "This file cannot be deleted"
	fi
else 
        echo "This is not a corect file name or the path and can not be removed with this program"
fi 
}
#calling setup function, i.e is there a config file or a bin folder
#setup $@
#calling filecheck, i.e does the file exist ?
echo $@
filecheck $@


