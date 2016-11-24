#!/bin/bash

DELETE_DELAY_CMD="sudo tc qdisc del dev eth0 root netem"

for i in {2..10}; do
	if echo $DELETE_DELAY_CMD | ssh -o ServerAliveCountMax=5 -o ServerAliveInterval=1 192.168.1.$i bash; then
		echo "Successfully removed delay for 192.168.1.$i"
	else
		echo "192.168.1.$i is not reachable."
	fi
done
