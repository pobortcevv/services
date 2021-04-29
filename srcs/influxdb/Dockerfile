FROM alpine:3.12.3

RUN apk update
RUN apk add supervisor influxdb libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY ./telegraf.conf /etc/telegraf/

COPY ./supervisord.conf /etc/
COPY ./start_influxdb.sh /

EXPOSE 8086
ENTRYPOINT sh start_influxdb.sh
