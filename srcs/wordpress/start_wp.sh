#!/bin/sh

/usr/sbin/php-fpm7 -F
nginx -g 'daemon off;'
