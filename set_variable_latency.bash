#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Need exactly two arguments - delay value (e.g. 30ms) and IP of the host."
	exit 1
fi

DELAY=$1
HOST=$2

echo $DELAY

SET_DELAY="sudo tc qdisc add dev eth0 root netem delay $DELAY"

if echo $SET_DELAY | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 $HOST bash; then
	echo "$HOST successfully set for delay = $DELAY"
else
	echo "$HOST is not reachable."
fi
