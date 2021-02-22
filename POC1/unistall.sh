    systemctl stop cpu_usage_controller
    systemctl disable cpu_usage_controller
    systemctl daemon-reload
    
    sudo rm -r /var/log/test_cpu_usage
    sudo rm /etc/systemd/system/cpu_usage_controller.service
    sudo rm /usr/local/bin/test_cpu_usage.sh