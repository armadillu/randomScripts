#!/bin/bash

url="http://uri.cat/blog/random-writings/"

while true; 
do
	previous=`cat md5.txt`;
	now=`curl --silent  $url | md5`;
	
	#echo $previous "?" $now;
	if [ "$previous" == "$now" ]; then
		echo "cache hasnt changed";
	else
		echo "cache has changed!";
		timeNow=`date`;
		growlnotify -t "URL changed for $url " -m "$ $timeNow"  -p 2 -s		
	fi;
	echo $now > md5.txt;

	sleep 60;
done;