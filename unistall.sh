    systemctl stop cpu_usage_controller
    systemctl disable cpu_usage_controller
    systemctl daemon-reload
    
    rm -r /var/log/test_cpu_usage
    rm /etc/systemd/system/cpu_usage_controller.service
    rm /usr/local/bin/test_cpu_usage.sh