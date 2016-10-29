#!/bin/bash

CMD="/home/pi/spark-2.0.1-bin-hadoop2.7/sbin/start-slave.sh spark://192.168.1.1:7077"

for i in {2..10}; do
    echo $CMD | ssh 192.168.1.$i bash
done
    
