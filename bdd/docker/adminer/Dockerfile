FROM legrizzly/php_alpine:1.0.1

COPY src/adminer-4.8.1.php /srv/index.php

WORKDIR /srv

EXPOSE 80

ENTRYPOINT ["/sbin/tini", "--"]

CMD /usr/bin/php \
    -d memory_limit=256M \
    -d upload_max_filesize=2048M \
    -d post_max_size=2048M \
    -S 0.0.0.0:80

# <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Adminer Dockerfile - PHP 8.3
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
