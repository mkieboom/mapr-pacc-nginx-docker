#!/bin/bash

# Check if the /mapr/clustername mountpoint is available
if [ "$(sudo ls /mapr/ |wc -l)" -eq 0 ]; then
  echo "MapR not running. exiting."
  exit
else
  # Copy index.php to the nginx web root folder
  /bin/cp -rf /index.php /usr/share/nginx/html/index.php

  # Launch php & nginx
  sudo php-fpm && sudo nginx -g 'daemon off;'
fi