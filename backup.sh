#!/bin/sh
#A backup script to backup the pi sd card as an image file on my 
#network share. This program will be called via a cron job every week. 

#CRON 
#
#0 0 * * 7 ~/scripts/pibackup.sh 
#this will execute at midnight on sunday of each week

#MAIN PROGRAM
#asign the date to var 

#echo to log file that the backup started.
echo "back up started at " `date` >> /home/jim/backup.log.txt
#var for date
d=`date +%d%m%Y`
#command to back up 

#echo to the log file that the backup was completed
echo "back up complete at "  `date` >> /home/jim/backup.log.txt

