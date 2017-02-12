# Raspberry Pi Server Setup

## Pre

0. [Download Raspian Lite](https://www.raspberrypi.org/downloads/raspbian/)
0. [Write `.iso` to SD](https://www.raspberrypi.org/documentation/installation/installing-images/)
0. Boot with wired monitor and keyboard. Log in with `pi/raspberry`
0. Change the password and remember it: `passwd`
0. Run `sudo rasbi-config` and enable "SSH" under "Advanced Options".
0. Boot with ethernet only. Find the IP of your raspberry pi on your router's admin page.

## Add your public key to the server
```
cat ~/.ssh/id_rsa.pub | ssh pi@192.168.0.4 'mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys'
```

## Run remote scripts
```
ssh pi@192.168.0.4 "bash -s" < ./update.bash
ssh pi@192.168.0.4 "bash -s" < ./firewall.bash
ssh pi@192.168.0.4 "bash -s" < ./tools.bash
```
