#! /bin/bash
# this program will take data from the user and return it to the 
#terminal and also save it to a file.

clear
echo "Hello $USER, I am Benzene. The server AI."

echo "I will now create a your profile for my records"

change_name = read "Would you like to change your User Name ?"

	if [ $change_name == "y" ] then
		name = read "Please enter your new user name."

	else
		echo "OK, Lets continue"

	fi

age = read "Please enter your age"

# add check to see if the user entered a int

security_question = read "Please ansser this security question. \n What is you favorate color ?"

#write the varibles to a csv file. 


 	
