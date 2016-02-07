#!/bin/bash
#NOT COMPLETED.
#this program will preform mathamatic operations on 
#the variables supplied by the user.

clear
#functions
add () #ADD FUNCTION, ASK USER FOR TWO INTS AND ADD TOGETHER
{
	echo "You have chosen addition"
        echo "Enter your first number"
        read num1
        echo "Enter second number"
        read num2
        echo " $(($num1 + $num2))"
}

#Great the user, and start the program.
echo "Hello $USER, I am Benzene the server AI."
#ADD A LOOP
printf "What calculation would you like to preform\n
a = addition
s = substraction
m = mult
d = division
"
read cal
#use cases to move forward.
case $cal in 
	a) add 1 ;;# Open the add function.
	s) echo " You haven chosen subtraction";;
	m) echo "You have chosen mult";;
	d) echo "You haven chosen division";;
	*) echo "You have not entered a corect choice";;

esac 
#ENDL LOOP
