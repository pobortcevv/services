FROM alpine:3.12.1

RUN apk update && apk upgrade
RUN apk update && apk upgrade \
    && apk add mariadb mariadb-client curl supervisor\
    && apk add openrc \
    && rm -rf /var/cache/apk/*

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /run/mysql/
RUN chmod -R 777 /var/lib/mysql/

COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/
COPY db.sql /
COPY init_database.sql /
COPY start_db.sh /
COPY db.cnf /etc/

RUN chmod u+x start_db.sh
VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306
ENTRYPOINT sh start_db.sh
