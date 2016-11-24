#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No arguments provided. Give the value of delay to be set along with units. For example - 30ms"
	exit 1
fi

DELAY=$1

SET_DELAY="sudo tc qdisc add dev eth0 root netem delay $delay"

for i in {2..10}; do
	if echo $SET_DELAY | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 192.168.1.$i bash; then
		echo "192.168.1.$i successfully set for delay = $DELAY"
	else
		echo "192.168.1.$i is not reachable."
	fi
done
