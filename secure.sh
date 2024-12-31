#!/bin/bash

# Enable UFW firewall
echo "Enabling UFW firewall..."
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

