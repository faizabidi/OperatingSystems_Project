#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No arguments provided. Give the filename to copy."
	exit 1
fi

filename=$1

CMD="scp $1"

for i in {2..10}; do
     scp $filename 192.168.1.$i:/home/pi/spark-2.0.1-bin-hadoop2.7/conf
done
    
