FROM alpine

RUN apk  update && apk  upgrade
RUN apk  add nginx openssl supervisor

COPY ./default /etc/nginx/sites-available/default
COPY ./supervisord.conf /etc/supervisord.conf

RUN chmod +rw /etc/supervisord.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 63 -nodes -verbose -out /etc/ssl/certs/sabra.crt -keyout /etc/ssl/private/sabra.key -subj "/C=RU/ST=Moscow/L=Moscow/O=42 School/OU=sabra/CN=html"

EXPOSE 80 443
ENTRYPOINT bash nginx_start.sh
