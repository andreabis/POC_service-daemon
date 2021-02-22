#!/bin/bash

res=$(top -bn 1 | head -n 8 | tail -n 1)
echo $res
read -ra arr <<< $res
for i in {0..11}
do
    output+=${arr[$i]}"\t"
done
echo -e $output
echo -e $output >> /var/log/test_cpu_usage/log.txt 