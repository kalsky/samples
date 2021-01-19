#!/bin/bash
apt-get update
apt install curl -y
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt install nodejs
apt-get install nginx -y
git clone https://github.com/kalsky/glass-website --depth 1 --branch=master /var/www/website
cd /etc/nginx/sites-available/
cp default default.backup

cat << EOF > ./default
server {
listen 80 default_server;
listen [::]:80 default_server;
root /var/www/promotions-manager;
server_name _;
index index.html index.htm;
location /api {   
  proxy_http_version 1.1;
  proxy_set_header Upgrade \$http_upgrade;
  proxy_set_header Connection 'upgrade';
  proxy_set_header Host \$host;
  proxy_cache_bypass \$http_upgrade;
  proxy_read_timeout 600s;
}
location / {
  try_files \$uri /index.html;
}
}
EOF