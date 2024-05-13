#!/bin/sh
# chown -R postgres "$PGDATA"

echo "########## Initializing datadir..."
mkdir -p "$PGDATA"
chown -R postgres "$PGDATA"
chmod 700 "$PGDATA"

mkdir -p /var/run/postgresql
chown -R postgres:postgres /var/run/postgresql
chmod 775 /var/run/postgresql

echo "PGDATA: $PGDATA"

ls -al $PGDATA

if [ -z "$(ls -A "$PGDATA")" ]; then
    echo "########## Initializing database..."
    # su-exec postgres initdb
    su-exec postgres initdb --username="$POSTGRES_USER"

    sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

    : ${POSTGRES_USER:="postgres"}
    : ${POSTGRES_DB:=$POSTGRES_USER}

    if [ "$POSTGRES_PASSWORD" ]; then
      pass="PASSWORD '$POSTGRES_PASSWORD'"
      authMethod=password
    else
      echo "======================================="
      echo "=       !!! NO PASSWORD SET !!!       ="
      echo "= Default password will be generated  ="
      echo "=         PASSWORD 'postgres'         ="
      echo "=  (Use \$POSTGRES_PASSWORD env var)  ="
      echo "======================================="
      pass="PASSWORD 'postgres'"
      authMethod=password
    fi
    echo

    if [ "$POSTGRES_DB" != 'postgres' ]; then
      createSql="CREATE DATABASE $POSTGRES_DB;"
      echo $createSql | su-exec postgres postgres --single -jE
      echo
    fi

    if [ "$POSTGRES_USER" != 'postgres' ]; then
      op=CREATE
    else
      op=ALTER
    fi

    userSql="$op USER $POSTGRES_USER WITH SUPERUSER $pass;"
    echo $userSql | su-exec postgres postgres --single -jE
    echo

    su-exec postgres pg_ctl -D "$PGDATA" \
        -o "-c listen_addresses=''" \
        -w start

    echo
    for f in /docker-entrypoint-initdb.d/*; do
        case "$f" in
            *.sh)  echo "$0: running $f"; . "$f" ;;
            *.sql) echo "$0: running $f"; psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < "$f" && echo ;;
            *)     echo "$0: ignoring $f" ;;
        esac
        echo
    done

    su-exec postgres pg_ctl -D "$PGDATA" -m fast -w stop

    { echo; echo "host all all all trust"; } >> "$PGDATA"/pg_hba.conf
fi

exec su-exec postgres "$@"
