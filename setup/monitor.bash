#!/bin/bash -eux

# 1. Let your pi send email
# $PASSWD should be a gmail app specific password for this server.
sudo apt-get install ssmtp mailutils -y

sudo vim /etc/ssmtp/ssmtp.conf

# contents should be
root=postmaster
mailhub=smtp.gmail.com:587
hostname=raspberrypi
AuthUser=clint@ctro.net
AuthPass=$PASSWD
FromLineOverride=YES
UseSTARTTLS=YES

# test mail
echo "Hello world email body" | mail -s "Test Subject" clint@ctro.net

# 2. Set up moitoring
sudo apt-get install logwatch -y

sudo vim /usr/share/logwatch/default.conf/logwatch.conf

# Change:
MailTo = clint@ctro.net
MailFrom = clint@ctro.net
