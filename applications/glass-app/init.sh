"#!/bin/bash\napt-get update\napt install curl -y\ncurl -sL https://deb.nodesource.com/setup_10.x\
  \ | bash -\napt install nodejs\napt-get install nginx -y\ngit clone https://github.com/kalsky/glass-website\
  \ --depth 1 --branch=master /var/www/website\ncd /etc/nginx/sites-available/\ncp\
  \ default default.backup\n\ncat << EOF > ./default\nserver {\nlisten $PORT default_server;\n\
  listen [::]:$PORT default_server;\nroot /var/www/website;\nserver_name _;\nindex\
  \ index.html index.htm;\nlocation /api {   \n  proxy_http_version 1.1;\n  proxy_set_header\
  \ Upgrade \\$http_upgrade;\n  proxy_set_header Connection 'upgrade';\n  proxy_set_header\
  \ Host \\$host;\n  proxy_cache_bypass \\$http_upgrade;\n  proxy_read_timeout 600s;\n\
  }\nlocation / {\n  try_files \\$uri /index.html;\n}\n}\nEOF\n"
