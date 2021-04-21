#!/bin/sh

rc-service nginx restart
rc-service php-fpm7 restart
sleep infinity
