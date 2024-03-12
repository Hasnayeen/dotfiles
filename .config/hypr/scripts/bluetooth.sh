#!/bin/bash

# Check if the Bluetooth service is active
if systemctl is-active --quiet bluetooth.service; then
    hyprctl dispatch exec [floating] blueman-manager
else
    # Start the Bluetooth service
    systemctl start bluetooth.service

    # Check if the service started successfully
    if [ $? -eq 0 ]; then
        hyprctl dispatch exec [floating] blueman-manager
    else
        echo "Failed to start Bluetooth."
        exit 1
    fi
fi

