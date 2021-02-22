
create_folder () {
    mkdir /var/log/test_cpu_usage
    cp cpu_usage_controller.service /etc/systemd/system/cpu_usage_controller.service
    cp test_cpu_usage.sh /usr/local/bin/test_cpu_usage.sh
    cd /var/log/test_cpu_usage
    chmod -R 777 ./
    touch log2.txt
    chmod 777 log2.txt 
    result=$(top -bn 1 | head -n 8 | tail -n 1)
    $(printf "%10s" ${result[@]}) > /var/log/test_cpu_usage/log2.txt
    cd /usr/local/bin/
    chmod -R 777 ./
    chmod 777 test_cpu_usage.sh
    systemctl disable cpu_usage_controller
    systemctl daemon-reload
    systemctl enable cpu_usage_controller
    systemctl start cpu_usage_controller
    systemctl status cpu_usage_controller
    systemctl stop cpu_usage_controller
    echo "file copied"
}

result="$(create_folder)"
echo $result

