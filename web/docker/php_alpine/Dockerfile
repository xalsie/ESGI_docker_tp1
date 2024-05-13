FROM alpine:3.19.1

RUN apk --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing/ add \
    wget \ 
    curl \
    git \
    php83-fpm \
    php83-curl \
    php83-openssl \
    php83-iconv \
    php83-json \
    php83-mbstring \
    php83-pgsql \
    php83-pdo_pgsql \
    php83-session \
    php83-phar && \
    ln -sf /usr/bin/php83 /usr/bin/php

    # rm /var/cache/apk/* #! use --no-cache

RUN mkdir -p /var/www
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
