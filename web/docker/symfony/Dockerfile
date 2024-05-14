FROM legrizzly/php_alpine:latest

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# # ensure www-data user exists
# RUN  adduser -u 82 -D -S -G www-data www-data

# # FIX volume Permission denied
# RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod 755 /var/www/html

# Install Symfony CLI
RUN apk update && apk add --no-cache bash

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | /bin/bash

RUN apk add symfony-cli

WORKDIR /var/www/html

# RUN /usr/bin/composer create-project symfony/skeleton /var/www/html/my_project --no-interaction

# ENTRYPOINT ["symfony server:start"]

# FIX showlog Permission denied
RUN mkdir -p /var/log && chmod 777 /var/log

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 9000

WORKDIR /var/www

CMD ["/usr/sbin/php-fpm", "-R", "--nodaemonize"]

# composer create-project symfony/skeleton:"7.0.*" my_project_directory
# cd my_project_directory
# composer require webapp

# RUN 
# <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Symphony
# 
#  #  Developed by    : legrizzly_0341 | skycer05 | rashmi15
#  #  GitHub          : https://github.com/xalsie
#  #  Docker Hub      : https://hub.docker.com/u/legrizzly
#
# ██      ███████  ██████  ██████  ██ ███████ ███████ ██      ██    ██
# ██      ██      ██       ██   ██ ██    ███     ███  ██       ██  ██
# ██      █████   ██   ███ ██████  ██   ███     ███   ██        ████
# ██      ██      ██    ██ ██   ██ ██  ███     ███    ██         ██
# ███████ ███████  ██████  ██   ██ ██ ███████ ███████ ███████    ██
#
#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~_Update: 14/05/24_~~-->
