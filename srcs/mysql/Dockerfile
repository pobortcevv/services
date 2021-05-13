FROM alpine:3.12.3

VOLUME ["/var/lib/mysql"]

RUN apk update
RUN apk add\
	mysql\
	mysql-client\
	openrc\
	libc6-compat\
	supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY ./telegraf.conf /etc/telegraf/

COPY ./supervisord.conf /etc/

COPY ./init_db.sql /
COPY ./mysql-service.sql /
COPY ./my.cnf /etc/
COPY ./start_mysql.sh /

EXPOSE 3306

CMD /start_mysql.sh
