#!/bin/bash

START_CMD="/home/pi/spark-2.0.1-bin-hadoop2.7/sbin/start-slave.sh spark://192.168.1.1:7077"
STOP_CMD="/home/pi/spark-2.0.1-bin-hadoop2.7/sbin/stop-slave.sh"

for i in {2..10}; do
	if echo $STOP_CMD | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 192.168.1.$i bash && echo $START_CMD | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 192.168.1.$i bash; then
		echo "192.168.1.$i successfully restared."
	else
		echo "192.168.1.$i is not reachable."
	fi
done
