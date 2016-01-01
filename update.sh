
#!/usr/bin/env bash
#this shell script will update and upgrade the pi. 

# a cron job will call this job at midnight each day 
#0 0 * * * userName /home/userName/path/to/file
d=`date +%d%m%Y`

#echo to log file that the update process has started
echo "update started at" `date` >> /home/jagopi/log.txt
#update repos 
sudo apt-get update
#update the pi
sudo apt-get upgrade -y
#sudo reboot
