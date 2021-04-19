FROM alpine:3.12.1

RUN apk  update && apk  upgrade
RUN apk  add nginx openssl supervisor
RUN mkdir -p /run/nginx

COPY ./default /etc/nginx/sites-available/default
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./nginx_start.sh /

RUN chmod +rw /etc/supervisord.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 63 -nodes -verbose -out /etc/ssl/certs/sabra.crt -keyout /etc/ssl/private/sabra.key -subj "/C=RU/ST=Moscow/L=Moscow/O=42 School/OU=sabra/CN=html"

EXPOSE 80 443
ENTRYPOINT sh nginx_start.sh
