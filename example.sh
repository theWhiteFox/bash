#!/bin/bash
function tes (){
	echo "this is a function"
	git add .
	git commit -m "testing"
	git push -u origin master
}
function check (){
	if [[ $PWD = /home/jim/scripts/* ]]; then
		echo "I am in the scripts folder"

	fi
}

echo $("date")
touch file
mv file file.copy
if [ -f file.copy ]; then
	echo "it worked"
else
	echo "shit"

fi
#git push origin master
tes
check

