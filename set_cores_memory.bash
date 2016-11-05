#!/bin/bash

if [ $# != 2 ]; then
	echo "Please provide eactly 2 arguments." 
	echo "Give the cores, and memory to set on executers."
	exit 1
fi

cores=$1
memory=$2

sed -i "s/SPARK_WORKER_CORES.*/SPARK_WORKER_CORES=$cores/g" ~/spark-2.0.1-bin-hadoop2.7/conf/spark-env.sh
sed -i "s/SPARK_WORKER_MEMORY.*/SPARK_WORKER_MEMORY=$memory/g" ~/spark-2.0.1-bin-hadoop2.7/conf/spark-env.sh 
