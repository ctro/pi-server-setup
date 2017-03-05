#!/bin/bash -eux

ssh pi@pi-server "mkdir -p /home/pi/sustainable"
#scp -r ../sustainable pi@pi-server:/home/pi/sustainable/html
rsync -rv --exclude='*.git' ../sustainable/ pi@pi-server:/home/pi/sustainable/
ssh pi@pi-server "sudo rm -rf /var/www/sustainable"
ssh pi@pi-server "sudo mv /home/pi/sustainable /var/www/sustainable"
ssh pi@pi-server "chmod -R 755 /var/www/sustainable"
