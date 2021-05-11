#!/bin/sh
rc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < init_database.sql
#mysql -u root wordpress < mysql-service.sql
rc-service mariadb stop
supervisord -c /etc/supervisord.conf
