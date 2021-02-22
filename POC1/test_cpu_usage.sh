#!/bin/bash

res=$(top -bn 1 | head -n 8 | tail -n 1)
#printf "%s\n" "${!arr[@]}" 
printf "%10s" ${res[@]} >> /var/log/test_cpu_usage/log2.txt
echo 
#echo -e $output >> /var/log/test_cpu_usage/log.txt