FROM alpine:3.12.1

# Создание доп хранилища
VOLUME ["/var/lib/mysql"]

RUN apk  update && apk  upgrade
RUN apk add mysql mysql-client openrc libc6-compat supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf /etc/telegraf/

COPY supervisord.conf /etc/
COPY db.sql /
COPY init_database.sql /
COPY start_db.sh /
COPY db.cnf /etc/

EXPOSE 3306
ENTRYPOINT sh start_db.sh
