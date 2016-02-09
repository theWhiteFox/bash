#this will be an automated script to commit changes to github

# commands to commit to GruncleJim github
echo $(clear)
#VARIABLES
DIR="/home/jim/scripts/"
message=$1
#FUNCTIONS

#COMMIT FUNCTION
commit () {
	#COMMIT COMANDS 
	echo "this is a test"
	echo $(git add .)
	echo $(commit - m "$message")
	echo $(git push -u origin master)
	echo $($?) 
	if [ $? == 0 ];then
	
		echo "You have completed your commit"

	else
		echo"You have not completed you\`r commit"
		echo"ERROR CODE : $?"
	fi
}

#if the user is in the scripts dir run the commit
echo $(pwd)
echo $DIR
if [[ $PWD/ = /home/jim/scripts* ]]; then
	commit	
else
	printf "\n\nYou are not in $DIR folder.\n"
	echo "Would you like to move to this folder and continue"
	read move
	$move = "${move^^}"
	
	echo $move
	CORRECT =1
	while [ $CORRECT -ne  0 ];do
		if [ $move == "y" ];then 
			#run the commit function
			commit
			$CORRECT =1
		elif [ $move == "n" ];then
			echo "The Program will now close, Move to dir and restart Program."
			$CORRECT =1
			exit
		else
			printf"\n\nYou have not entered a corect option"
			echo"Please restart the program" 
		fi
	done

fi



read nothing
