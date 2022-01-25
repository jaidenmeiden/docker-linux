# Download base image Debian Stretch
FROM debian:stretch

# LABEL about the custom image
LABEL maintainer="jaidenmeiden@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for the PHP-FPM and Nginx Services."

# Disable Prompt During Packages Installation
# ARG DEBIAN_FRONTEND=noninteractive

# Update Debian Software repository
RUN apt-get update

# Install nginx, php-fpm and supervisord from debian repository
# https://packages.debian.org/search?keywords=php-fpm
RUN apt-get install -y locales nginx php-fpm supervisor && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get clean

# Activate shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
    
# Define the ENV variable
ENV LANG en_US.utf8
ENV nginx_vhost /etc/nginx/sites-available/default
ENV php_conf /etc/php/7.0/fpm/php.ini
ENV nginx_conf /etc/nginx/nginx.conf
ENV supervisor_conf /etc/supervisor/supervisord.conf

# Enable PHP-fpm on nginx virtualhost configuration
COPY docker-compose/source/default ${nginx_vhost}
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' ${php_conf} && \
    echo "\ndaemon off;" >> ${nginx_conf}
    
# Copy supervisor configuration
COPY docker-compose/source/supervisord.conf ${supervisor_conf}

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /var/www/html && \
    chown -R www-data:www-data /run/php
    
# Volume configuration
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Copy start.sh script and define default command for the container
COPY docker-compose/source/start.sh /start.sh
CMD ["./start.sh"]

# Expose Port for the Application 
EXPOSE 80 443