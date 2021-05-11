FROM alpine:3.12.1

RUN apk  update && apk  upgrade
RUN apk  add nginx openssl supervisor libc6-compat
RUN mkdir -p /run/nginx

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY ./telegraf.conf /etc/telegraf/

COPY ./default /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./nginx_start.sh /
COPY ./index.html /www/

RUN chmod +rw /etc/supervisord.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 63 -nodes -verbose -out /etc/ssl/certs/sabra.crt -keyout /etc/ssl/private/sabra.key -subj "/C=RU/ST=Moscow/L=Moscow/O=42 School/OU=sabra/CN=html"

EXPOSE 80 443
ENTRYPOINT sh nginx_start.sh
