#!/bin/bash -eux

# Move html directory onto server
scp -r ./html pi@pi-server:/home/pi

# delete old site and move new one
ssh pi@pi-server "sudo rm -rf /var/www/html"
ssh pi@pi-server "sudo mv /home/pi/html /var/www"
