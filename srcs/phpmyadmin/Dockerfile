FROM alpine:3.12.3

RUN apk update
RUN apk add nginx supervisor php7 \
		php7-mysqli\
		php7-zlib\
		php7-curl\
		php7-mbstring\
		php7-json\
		php7-session\
		php7-fpm\
		libc6-compat &&\
		mkdir -p /run/nginx

# telegraf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY ./telegraf.conf /etc/telegraf/

# phpmyadmin

RUN mkdir -p /www/phpmyadmin/tmp &&\
	chmod 777 /www/phpmyadmin/tmp &&\
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz &&\
	tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /www/phpmyadmin &&\
	rm phpMyAdmin-5.0.4-all-languages.tar.gz
COPY ./config.inc.php /www/phpmyadmin/

# nginx

COPY ./default /etc/nginx/conf.d/default.conf
COPY ./index.html /www/

# supervisor

COPY ./supervisord.conf /etc/
COPY ./php_start.sh /

EXPOSE 5000
ENTRYPOINT sh php_start.sh
