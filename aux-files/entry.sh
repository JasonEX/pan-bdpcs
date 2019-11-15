#!/bin/sh
groupmod -o -g ${GID} www-data
usermod -o -u ${UID} www-data

chown -R www-data:www-data /home/www-data/Downloads

su -c '/BaiduPCS-Go' www-data

exec "$@"