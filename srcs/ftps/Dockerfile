FROM alpine:3.12.3

RUN apk update
RUN apk add\
	vsftpd\
	openssl\
	libc6-compat\
	supervisor &&\
	mkdir -p /var/ftp

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN openssl req\
	-x509\
	-nodes\
	-days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21_school, Inc./CN=sabra_21.com"\
	-addext "subjectAltName=DNS:sabra.com"\
	-newkey rsa:2048\
	-keyout /etc/vsftpd/sabra.key\
	-out /etc/vsftpd/sabra.crt

RUN adduser -D -g 'sabra' sabra
RUN echo "sabra:sabra_21" | chpasswd

COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/
COPY ./start_ftps.sh /

COPY ./vsftpd.conf /etc/vsftpd/

EXPOSE 21 21000
ENTRYPOINT sh start_ftps.sh
