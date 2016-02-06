#!/bin/bash
#this program will print out 3 parameters entered when the program was started 
clear
#asign the positional parameters to variables.


POSPAR1="$1"
POSPAR2="$2"
POSPAR3="$3"
#print variables
# if the user dose not enter any PP the program will return ERROR
if [ $# -eq 0 ] ;then 
	printf "ERROR : You have not enterd any Positional Parameters.\n
	\n Use the following as an example.\n
	./positional.sh one two three.\n\n"
else
	echo "$1 is the first positional parameter entered, \$1."
	echo "$2 is the second positional parameter entered \$2."
	echo "$3 is the third postional parameter entered \$3."

	printf "\n\nThe total number of positional parameters is $#.\n"
fi

#exit the program
printf "The program has now finished.\nPlease press any key to continue."
read nothing
 
