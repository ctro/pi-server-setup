#!/bin/bash -eux

# Move some html directory onto server
scp -r ../3peaks pi@pi-public:/home/pi/htl

# delete old site and move new one
ssh pi@pi-public "sudo rm -rf /var/www/html"
ssh pi@pi-public "sudo mv /home/pi/html /var/www"
ssh pi@pi-public "chmod -R 755 /var/www/html"
