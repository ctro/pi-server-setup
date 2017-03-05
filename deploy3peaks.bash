#!/bin/bash -eux

# 3peaks
ssh pi@pi-server "mkdir -p /home/pi/3peaks"
#scp -r ../3peaks pi@pi-server:/home/pi/3peaks/html
rsync -rv --exclude='*.git' ../3peaks/ pi@pi-server:/home/pi/3peaks/
ssh pi@pi-server "sudo rm -rf /var/www/3peaks"
ssh pi@pi-server "sudo mv /home/pi/3peaks /var/www/3peaks"
ssh pi@pi-server "chmod -R 755 /var/www/3peaks"
