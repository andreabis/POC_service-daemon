#!/bin/bash

case "$1" in 
start)
   top -bn 1 | head -n 8 | tail -n 1 >> /var/log/test_cpu_usage/log.txt
   /usr/local/bin/test_cpu_usage.sh & echo $!>/var/run/hit.pid   
   #while true; do
   
   sleep 10
   #echo ""
   #done
   
   ;;
stop)
   kill `cat /var/run/hps aux | grep -i it.pid`
   rm /var/run/hit.pid
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
   if [ -e /var/run/hit.pid ]; then
      echo hit.sh is running, pid=`cat /var/run/hit.pid`
   else
      echo hit.sh is NOT running
      exit 1
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 