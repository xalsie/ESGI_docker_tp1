FROM alpine:3.19.1

RUN apk --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing/ add \
    wget \ 
    curl \
    git \
    tini \
    php83 \
    php83-ctype \
    php83-curl \
    php83-dom \
    php83-fileinfo \
    php83-fpm \
    php83-gd \
    php83-intl \
    php83-iconv \
    php83-json \
    php83-pgsql \
    php83-pdo_pgsql \
    php83-mbstring \
    php83-mysqli \
    php83-opcache \
    php83-openssl \
    php83-phar \
    php83-session \
    php83-tokenizer \
    php83-xml \
    php83-xmlreader \
    php83-zip \
    php83-zlib \
    php83-simplexml \
    php83-xmlwriter \
    php83-posix \
    php83-xmlwriter
    # rm /var/cache/apk/* #! use --no-cache

# Create symlink for php
RUN ln -s /usr/bin/php83 /usr/bin/php
RUN ln -s /usr/sbin/php-fpm83 /usr/sbin/php-fpm

RUN mkdir -p /var/www

# ensure www-data user exists
RUN  adduser -u 82 -D -S -G www-data www-data

# FIX volume Permission denied
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod 755 /var/www/html
# <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Composer Dockerfile - PHP 8.3
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
