# Raspberry Pi Server Setup

## TODO:
- [ ] Let's Encrypt
- [ ] Cloud Flare
- [X] Logging
- [X] Static IP
- [ ] Battery Power

## Pre

0. [Download Raspian Lite](https://www.raspberrypi.org/downloads/raspbian/)
0. [Write `.iso` to SD](https://www.raspberrypi.org/documentation/installation/installing-images/)
0. Boot with wired monitor and keyboard. Log in with `pi/raspberry`
0. Change the password and remember it: `passwd`
0. Run `sudo rasbi-config` and enable "SSH" under "Advanced Options".
0. Boot with ethernet only. Find the IP of your raspberry pi on your router's admin page.

## Static IP steps
I have a single static IP on my gateway/router. In router admin page:

- DHCP Reservation lets you pin a specific private IP to the MAC address of a device.
- Port Forwarding lets you forward 80, 443, and 22 on to the pi.
This means only 1 server, but that's ok for now, the setup is way simpler this way.

You may also have to adjust IPV4 Firewall settings on your router. This is in addition to the OS-level firewall in `firewall.bash`
## Add pi-server host
`echo "192.168.0.3 pi-server" | sudo tee -a /etc/hosts`

## Disable remote root ssh login
`sudo vim /etc/ssh/sshd_config`
Set `PermitRootLogin` to `no`.
Add `AllowUsers pi`

## Add your public key to the server
`cat ~/.ssh/id_rsa.pub | ssh pi@pi-server 'mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys'`

## Run remote scripts
`bash setup.bash`

## Some scripts don't run automatically
- monitor.bash
- https.bash

## Deploy a site
`bash deploy.bash`
