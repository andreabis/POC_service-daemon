#!/bin/bash

res=$(top -bn 1 | head -n 8 | tail -n 1)
echo $res
echo $res >> /var/log/test_cpu_usage/log.txt 