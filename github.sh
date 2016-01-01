#!/usr/bin/env bash

# This program will create a new git hub repo online
#using my API key. 

#all git hub scripts are stored in the  ~/scripts dir 
#and will get it's argumets from the command line

filename="$1"
#echo $filename
#check if the file name exists 
if [ -f $filename ]; then 
	file_found=true
else
	file_found=false
fi

# check if user is iin the scripts directory or its childern
if [[ $PWD/ = $HOME/scripts/* ]] ; then 
	dir_found=true
else
	dir_found=false
fi

#if file name does not exists and we are in the scripts folder 
#continue to create the file and create a github repo
#else the program will alert user that they are not in the correct dir or 
#the file exists allready

if   [ $file_found = "false" ] && [ $dir_found = "true" ]  ; then 
	
	#echo "this is ok, we are in the right folder with no file of that name"
	#read file with api tag and asign to value
	apikey=$(cat $HOME/scripts/apikey.txt)
	
	#create file or dir and file
	
	curl -u "jimgogarty:$apikey" https://api.github.com/user/repos -d '{"name":"'$filename'"}'
	# if the repo has been created sucsessfully the file will be created
	#else an error will print
	if [ $? = 0 ] ; then 
		echo "File and GitHub Repo created."
		touch $filename
	else 
		echo "ERROR repo not created : $?."
	fi
	
else
	
	if [  $file_found = "true" ] ; then

		echo "the file name allready exists."
	elif [ $dir_found = "false" ] ; then 
		echo "You are not in the scripts dir. "
		echo "cd to the  scripts dir"

	fi
fi 
#end of program
