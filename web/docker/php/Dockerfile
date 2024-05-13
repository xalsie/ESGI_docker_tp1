FROM legrizzly/php_alpine:1.0.1


# ensure www-data user exists
RUN  adduser -u 82 -D -S -G www-data www-data

# FIX volume Permission denied
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod 755 /var/www/html

# FIX showlog Permission denied
RUN mkdir -p /var/log && chmod 777 /var/log

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 9000

WORKDIR /var/www

CMD ["/usr/sbin/php-fpm", "-R", "--nodaemonize"]

# <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  PHP-FPM 8.3 Dockerfile - PHP 8.3
# 
#  #  Developed by    : legrizzly_0341
#  #  GitHub          : https://github.com/xalsie
#  #  Docker Hub      : https://hub.docker.com/u/legrizzly
#
# ██      ███████  ██████  ██████  ██ ███████ ███████ ██      ██    ██
# ██      ██      ██       ██   ██ ██    ███     ███  ██       ██  ██
# ██      █████   ██   ███ ██████  ██   ███     ███   ██        ████
# ██      ██      ██    ██ ██   ██ ██  ███     ███    ██         ██
# ███████ ███████  ██████  ██   ██ ██ ███████ ███████ ███████    ██
#
#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~_Update: 28/03/24_~~-->
