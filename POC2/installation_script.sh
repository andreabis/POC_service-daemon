#!/bin/bash

create_file_log() {

    local res=$(top -bn 1 | head -n 7 | tail -n 1)
    echo $res
    read -ra arr <<< $res
    for i in {0..11}
    do
        output+=${arr[$i]}"\t"
    done
    echo -e $output > /var/log/test_cpu_usage/log.txt
}

create_folder () {
    mkdir /var/log/test_cpu_usage
    cp cpu_usage_controller.service /etc/systemd/system/cpu_usage_controller.service
    cp test_cpu_usage.sh /usr/local/bin/test_cpu_usage.sh
    cd /var/log/test_cpu_usage
    chmod -R +rx ./
    touch log.txt
    chmod +x log.txt 
    top -bn 1 | head -n 7 | tail -n 1 > /var/log/test_cpu_usage/log.txt
    create_file_log
    chmod +x log.txt 
    cd /usr/local/bin/
    chmod -R +rx ./
    chmod +x test_cpu_usage.sh
    systemctl disable cpu_usage_controller
    systemctl daemon-reload
    systemctl enable cpu_usage_controller
    systemctl start cpu_usage_controller
    sleep 5
    systemctl status cpu_usage_controller
    systemctl stop cpu_usage_controller
    echo "file copied"
}

result="$(create_folder)"
echo $result

