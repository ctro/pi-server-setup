#!/bin/bash -eux

# Disable all inboud connections
sudo apt-get install ufw -y
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw --force enable
sudo ufw status verbose
