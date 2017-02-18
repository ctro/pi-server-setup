#!/bin/bash -eux

# Use Let's Encrypt and certbot: https://certbot.eff.org/#debianjessie-nginx

1) Enable Jessie backports

sudo apt-get install certbot -t jessie-backports

run `sudo certbot`
make sure `certbot renew --dry-run` works.

2) Welll..... it's really easy to just use CloudFlare page rules for https always
