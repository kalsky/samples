"\"#!/bin/bash apt-get update apt install curl -y curl -sL https://deb.nodesource.com/setup_10.x\\\
  \n  \\ | bash - apt install nodejs apt-get install nginx -y git clone https://github.com/kalsky/glass-website\\\
  \n  \\ --depth 1 --branch=master /var/www/website cd /etc/nginx/sites-available/\
  \ cp default\\\n  \\ default.backup\\ncat << EOF > ./default server { listen $PORT\
  \ default_server; listen\\\n  \\ [::]:$PORT default_server; root /var/www/website;\
  \ server_name _; index index.html\\\n  \\ index.htm; location /api {   \\n  proxy_http_version\
  \ 1.1;\\n  proxy_set_header Upgrade\\\n  \\ \\\\$http_upgrade;\\n  proxy_set_header\
  \ Connection 'upgrade';\\n  proxy_set_header\\\n  \\ Host \\\\$host;\\n  proxy_cache_bypass\
  \ \\\\$http_upgrade;\\n  proxy_read_timeout 600s;\\n\\\n  } location / {\\n  try_files\
  \ \\\\$uri /index.html;\\n} } EOF\\n\"\n"
