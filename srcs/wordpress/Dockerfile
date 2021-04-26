FROM alpine:3.12.1

RUN apk update && apk upgrade
RUN apk add wget openssl php7 php7-zlib php7-curl php7-mbstring php7-json php7-session \
		php7-fpm php7-mysqli nginx supervisor
RUN apk add openrc --no-cache
RUN mkdir -p /run/nginx

RUN wget https://wordpress.org/latest.zip && unzip latest.zip && mv wordpress /www/ && rm latest.zip

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY start_wp.sh start_wp.sh
COPY supervisor.conf /etc/supervisord.conf
RUN chmod u+x start_wp.sh
COPY wp-config.php /www/
RUN rm -rf /www/wp-config-sample.php

EXPOSE 5050
ENTRYPOINT sh start_wp.sh
