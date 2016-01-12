#!/bin/sh
#A backup script to backup the server HDD to the mounted backup drive. 
#This program will be called via a cron job every week. 

#CRON 
#
#0 0 * * 7 ~/scripts/pibackup.sh 
#this will execute at midnight on sunday of each week

#MAIN PROGRAM

#echo to log file that the backup started.
echo "back up of SERVER01 started at " `date` >> /home/jim/log.txt
#command to back up to the backup server
sudo rsync -avz -delete --exclude '/media/*' / /media/backup-drive/server01
#echo to the log file that the backup was completed
echo "back up of SERVER01 complete at "  `date` >> /home/jim/log.txt

