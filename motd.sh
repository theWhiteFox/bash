#!/usr/bin/env bash
#--------------------------------#
#Bash script to change the message of the day. 
#this script will add a pun fron the pud of the day site below
#--------------------------------#

#asign values to todays date and  last date.
# if the last sate is less than todays date the script will continue and 
# rewrite the motd file located at /ect/motd 


last_date=$(cat ".date_log.txt")
echo $last_date
today=$(date +"%m-%d-%Y")
echo $today
if [[ $last_date < $today ]]; then
	echo $today > .date_log.txt
	echo "the program is srtarting" 
	#read index page from pun of the day and write to a temp file
	wget www.punoftheday.com -O temp.txt
	# read file line by line to find pun and asign to variable
	while read line ;do
        	if [[ $line ==  *"dropshadow1"* ]]; then
                	PUNLINE=$line
        	fi
	done < temp.txt
	
	#cut the pun out of the line of text
	cutpun=$(echo $PUNLINE | cut -d ';' -f2)
	finalcut=$(echo $cutpun | cut -d '&' -f1)
	#echo $finalcut
	#wirte the new motd file, useing colored fonts
	echo "$(tput setaf 3)
	Wellcome to the JaGoPi Server.

	Date :`date +"%A, %e %B %Y, %r"`
	$(tput setaf 2)
	Pun of the day : $finalcut
	$(tput setaf 1)

	IP Addresses.......: `/sbin/ifconfig eth0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1`

	$(tput sgr0)" >> motd.txt
	sudo mv motd.txt /etc/motd
	sudo chown root:root /etc/motd
	sudo rm ~/scripts/bash/temp.txt

fi
#end of program
