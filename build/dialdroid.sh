#!/bin/bash

dbname="collusion"
jarfile="dialdroid.jar"
classpath="/home/amiangshu/ICCDROID/android-platforms/"
dbhost="localhost"

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters. Use: directory category"
    exit 1
fi

category=$2
timelimit=1800


for file in $(find $1)
do
   if [[ $file == *.apk ]] 
   then
	echo $file	
	timeout $timelimit java -Xms4G -Xmx12G -jar $jarfile appanalysis $classpath  $dbname $dbhost $file $category
   fi
done

