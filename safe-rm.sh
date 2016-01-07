#!/bin/bash
##########################
#Author : James Gogarty
# Version : 1.0
# Date : 27-08-2014
#This program is a safe alternative to the Linux and Unix rm comand.
#For more informmation on how to use please use the README.TXT file
############################

setup ()
{
	if [ ! -f $HOME/.safe_rm_config ] 
	then	
		bin=$HOME/recyclebin
		
	else 		
		bin=$(cat $HOME/.safe_rm_config)
		if [ ! -d $bin ]
		then
		
			echo "The recycle bin dose not exist."
			read -p  "would you like to create the Directory in your Home directory. type \"y\" for yes and \"n\" for no : " answer
			# a case could be added 
			if [ "$answer" = "y" ]
			then
			mkdir $bin
			elif [ "$answer" = "n" ]
			then
				echo "Program will now close"
				exit 2
			else 
				#this program migt need a while or a do while
				echo "You have entered an invalid option"
			fi		
		fi
	fi
}

#delete file function
deleteFile ()
{
	# get the inode of the file, which will be added to the filename when moving to the bin
	inode=$(ls -i | grep $1 | cut -d " " -f1)	
	# add the inode number to the file and then move to the bin
	mv  $1 $1_$inode
	mv  $1_$inode $bin
	echo "the file is now in the bin, and can be forgoten about"
}
#move file function
movefile () 
{
deleteFile $@
}

filecheck ()
{
# if the file to del ete exits the file will be moved to Bin folder
if [ -f $1 ]
then 
	echo "File : $1 : will now be deleted"
	read -p "Are you sure you whish to delete a file : " confirm
	if [ "$confirm" = "y" ] || [ "$confirm" = "yes" ]
	then 
	 
	        movefile $@
	else 
		echo "This file will now be deleted"
	fi
else 
        echo "This is not a corect file name or the path is a directory and can not be removed with this program"
fi 
}
#calling setup function, i.e is there a config file or a bin folder
setup $@
#calling filecheck, i.e does the file exist ?
filecheck $@


