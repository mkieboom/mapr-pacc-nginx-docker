# Nginx with PHP on MapR PACC
#
# VERSION 0.1 - not for production, use at own risk
#

#
# Using MapR PACC as the base image
# For specific versions check: https://hub.docker.com/r/maprtech/pacc/tags/
FROM maprtech/pacc

MAINTAINER mkieboom @mapr.com

# Import Webstatic repo containing php7
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# Install and run Nginx
RUN yum install -y epel-release && \
  yum install -y nginx php70w-fpm


# Add the nginx.conf file to the container
# This config file has following pre-configured:
# - enabled php
# - enabled index.php file: index.html index.htm index.php;
# - allow directory browsing: autoindex on;
COPY nginx.conf /etc/nginx/nginx.conf

# Add an index.php page
COPY index.php /index.php

# Add the launch script which checks if the /mapr mountpoint is available in the container
ADD launch.sh /launch.sh
RUN sudo chmod +x /launch.sh

# Change user & group from apache to nginx
RUN sed -ie "s|user = apache|user = nginx|g" /etc/php-fpm.d/www.conf
RUN sed -ie "s|group = apache|group = nginx|g" /etc/php-fpm.d/www.conf

EXPOSE 80

# Launch PHP and nginx
CMD /launch.sh
CMD /bin/bash
