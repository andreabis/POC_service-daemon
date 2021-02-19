
create_folder () {
    mkdir /var/log/test_cpu_usage
    cp cpu_usage_controller.service /etc/systemd/system/cpu_usage_controller.service
    cp test_cpu_usage.sh /usr/local/bin/test_cpu_usage.sh
    cd /var/log/test_cpu_usage
    chmod -R +rx ./
    touch log.txt
    chmod +x log.txt 
    top -bn 1 | head -n 7 | tail -n 1 > /var/log/test_cpu_usage/log.txt
    cd /usr/local/bin/
    chmod -R +rx ./
    chmod +x test_cpu_usage.sh
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

