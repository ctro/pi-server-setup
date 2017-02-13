#!/bin/bash -eux

# Run this locally to set up your remote server
ssh pi@pi-server "bash -s" < ./setup/update.bash
ssh pi@pi-server "bash -s" < ./setup/firewall.bash
ssh pi@pi-server "bash -s" < ./setup/tools.bash
ssh pi@pi-server "bash -s" < ./setup/motd.bash
