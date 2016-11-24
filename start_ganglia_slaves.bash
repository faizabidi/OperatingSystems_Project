#!/bin/bash

START_CMD="sudo service ganglia-monitor restart"

for i in {2..10}; do
	if echo $START_CMD | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 192.168.1.$i bash; then
		echo "192.168.1.$i successfully restared."
	else
		echo "192.168.1.$i is not reachable."
	fi
done
