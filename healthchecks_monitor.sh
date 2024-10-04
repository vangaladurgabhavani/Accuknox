#! /usr/bin/bash
#------CPU USAGE-----------#
#mpstat -u
cpu=mpstat | awk 'FNR==4 {print $12}' | awk '{print $1}' | awk -F '.' '{print $1}'
if [ $cpu|int >= 20 ]
then
  echo "CPU utilization is low"
else
  echo "CPU utilization is high"
  echo "CPU utilization is high" >> /tmp/log
fi

#------MEMORY USAGE-----------#
#free | grep Mem
mem=free | grep Mem | awk '{print $3/$2 * 100.0}' | awk -F '.' '{print $1}'
if [ $mem|int <= 80 ]
then
  echo "MEMORY utilization is low"
else
  echo "MEMORY utilization is high"
  echo "MEMORY utilization is high" >> /tmp/log
fi

#------DISK USAGE-----------#
#df -h
disk=df | awk '0+$5 >= 80 {print}'
if [[ -z "$disk" ]]; then
   echo "DISK utilization is low"
else
  echo "DISK utilization is high"
  echo "DISK utilization is high" >> /tmp/log
fi


#------RUNNING PROCESSES-----------#
proc=ps -eo %cpu | awk '$1 >= 80 {print}'
if [[ -z "$proc" ]]; then
   echo "PROCESS utilization is low"
else
  echo "PROCESS utilization is high"
  echo "PROCESS utilization is high" >> /tmp/log
fi
