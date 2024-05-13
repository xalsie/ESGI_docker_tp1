FROM alpine:3.19.1

# 70 is the standard uid/gid for "postgres" in Alpine
# https://git.alpinelinux.org/aports/tree/main/postgresql/postgresql.pre-install?h=3.12-stable
RUN set -eux; \
	addgroup -g 1000 -S postgres; \
	adduser -u 1000 -S -D -G postgres -H -h /var/lib/postgresql -s /bin/sh postgres; \
	mkdir -p /var/lib/postgresql; \
	chown -R postgres:postgres /var/lib/postgresql

ENV LANG en_EN.utf8

RUN apk update && \
    apk add su-exec tzdata libpq postgresql postgresql-dev postgresql-url_encode && \
    mkdir /docker-entrypoint-initdb.d && \
    rm -rf /var/cache/apk/*

COPY entrypoint/docker-entrypoint.sh /

RUN chmod -R 777 /docker-entrypoint.sh && \
    mkdir -p /run/postgresql/ && \
    chown postgres:postgres /run/postgresql/

ENV PGDATA /var/lib/postgresql/data

# this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 1777 "$PGDATA"
# VOLUME /var/lib/postgresql/data

STOPSIGNAL SIGINT

EXPOSE 5432

ENTRYPOINT "/docker-entrypoint.sh"
# <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  postgres Dockerfile - Postgres 16.2
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
