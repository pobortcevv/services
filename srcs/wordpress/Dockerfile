FROM alpine:3.12.1

RUN apk update && apk upgrade \
    && apk add wget \
    && apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
    && apk add nginx openrc supervisor libc6-compat \
    && adduser -D -g 'www' www \
    && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir -p /run/nginx \
    && rm -rf /var/cache/apk/*

RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress /www/ \
    && rm latest.zip

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY start_wp.sh start_wp.sh
COPY supervisor.conf /etc/supervisord.conf
RUN chmod u+x start_wp.sh
COPY wp-config.php /www/wordpress/
#RUN rm -rf /www/wordpress/wp-config-sample.php

EXPOSE 5050
ENTRYPOINT sh start_wp.sh
