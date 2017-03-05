# Nginx Configuration

Neither is listed as default_server.  So, non matching goes to /var/www/html

## Setup

Add files below as `sites-available/...`.
Then link them
```
sudo ln -s /etc/nginx/sites-available/3peaks /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/sustainable /etc/nginx/sites-enabled/
```

Edit `/etc/nginx/nginx.conf` and uncomment this line ` server_names_hash_bucket_size 64;`

Remove the old default symlink
`sudo rm /etc/nginx/sites-enables/default`

Test the configs `sudo nginx -t`

Restart nginx `sudo systemctl restart nginx`

## For each new site

Add a sites-available config.

3peaks
/etc/nginx/sites-available/3peaks
```
server {
        listen 80;
        listen [::]:80;

        root /var/www/3peaks;
        index index.html;

        server_name 3peaksmassage.com www.3peaksmassage.com threepeaksmassage.com www.threepeaksmassage.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
```

sustainable, **is default**
/etc/nginx/sites-available/sustainable
```
server {
        listen 80;
        listen [::]:80 default_server;

        root /var/www/sustainable;
        index index.html;

        server_name sustainableserver.com www.sustainableserver.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
```
