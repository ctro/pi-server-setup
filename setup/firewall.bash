#!/bin/bash -eux

# Disable all inboud connections
sudo apt-get install ufw -y
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw --force enable
sudo ufw status verbose
