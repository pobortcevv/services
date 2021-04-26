rc default
/usr/bin/telegraf &
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < init_database.sql
mysql -u root sabra_database < db.sql
rc-service mariadb stop
supervisord -c /etc/supervisord.conf
