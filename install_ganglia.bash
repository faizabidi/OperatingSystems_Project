#!/bin/bash

# I was looking at first to edit the config file on each of the workers.
# But then realized that that is not a good solution.
# Better solution would be to edit one file, and copy that to all the workers. Stupid me.

#CMD1="sudo apt-get update -y"
#CMD2="sudo apt-get install -y ganglia-monitor"
#CMD3="sudo sed -i \"s/name\ =\ \"unspecified\"/name\ =\ \"OS_CLASS\"/g\" /etc/ganglia/gmond.conf"
#CMD4="sudo sed -i \"s/owner\ =\ \"unspecified\"/owner\ =\ \"Faiz\"/g\" /etc/ganglia/gmond.conf"
#CMD5="sudo sed -i \"s/mcast_join\ =\ 239.2.11.71/host\ =\ 192.168.1.1/g\" /etc/ganglia/gmond.conf"
#CMD6="sudo sed -i '41,45d' /etc/ganglia/gmond.conf"

CMD7="sudo service ganglia-monitor restart"
CMD8="./copy_files.bash gmond.conf /home/pi"

# Copy to home directory
# scp doesn't work with sudo. I had no idea that it doesn't :)
eval $CMD8

for i in {2..10}; do
	echo Working on slave 192.168.1.$i......
	ssh 192.168.1.$i "sudo mv gmond.conf /etc/ganglia && $CMD7"  
	echo Slave 192.168.1.$i done!
done
