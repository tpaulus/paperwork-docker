#! /bin/sh

cat << EOF > /opt/paperwork/frontend/app/storage/config/database.json
{"driver":"mysql",
 "database":"$DB_ENV_MYSQL_DATABASE",
 "host":"$DB_PORT_3306_TCP_ADDR",
 "username":"$DB_ENV_MYSQL_USER",
 "password":"$DB_ENV_MYSQL_PASSWORD",
 "port":"$DB_PORT_3306_TCP_PORT"
}
EOF

# Ensure migration is performed and database is not empty.
if [[ ! -e migrated ]]; then
    php artisan migrate
    touch migrated
fi

echo -n "8" > /opt/paperwork/frontend/app/storage/config/setup

# Run Web Server
lighttpd -f /etc/lighttpd/lighttpd.conf -D
