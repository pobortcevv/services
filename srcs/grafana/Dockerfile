FROM alpine:3.12.3

# Installing required packages.

RUN apk update
RUN apk add libc6-compat supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz
COPY ./telegraf.conf /etc/telegraf/

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz
RUN tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C /
RUN rm grafana-enterprise-7.3.6.linux-amd64.tar.gz
COPY ./grafana.db /data/

COPY ./supervisord.conf /etc/
COPY ./start_grafana.sh /

EXPOSE 3000
ENTRYPOINT sh start_grafana.sh
