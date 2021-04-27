#!/bin/sh
#rc default
#/etc/init.d/mariadb setup
#mysql -u root mysql < init_database.sql
#mysql -u root sabra_database < db.sql
#rc-service mariadb stop
#supervisord -c /etc/supervisord.conf
openrc default
#openrc-init
#openrc boot
#touch /run/openrc/softlevel
/etc/init.d/mariadb setup
#mysql_install_db --datadir=/var/lib/mysql
rc-service mariadb start 
mysql -u root < init_database.sql
#mysql -u root sabra_database  < /etc/db.sql 
rc-service mariadb stop 
/usr/bin/mysqld_safe 
