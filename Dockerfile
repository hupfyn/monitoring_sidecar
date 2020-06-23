FROM debian:stretch-slim

ENV TELEGRAF_VERSION 1.13.4
ENV PROMTAIL_VERSION 1.4.0


RUN mkdir -p /usr/src /etc/telegraf /etc/promtail /opt/log
COPY entrypoint.sh /opt/

# Install utils and other staff
RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apt-get update && \
  apt-get install -qy \
  tzdata ca-certificates libsystemd-dev procps nano wget curl iputils-ping unzip sudo gettext-base && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /tmp/


# Setup Telegraf
RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    rm -rf telegraf_1.13.4-1_amd64.deb

# Setup Promtail
RUN wget --no-verbose https://github.com/grafana/loki/releases/download/v${PROMTAIL_VERSION}/promtail-linux-amd64.zip && \
    unzip "promtail-linux-amd64" && rm -rf promtail-linux-amd64.zip && chmod a+x promtail-linux-amd64 && \
    mv promtail-linux-amd64 /usr/bin/promtail

ENTRYPOINT ["sh","/opt/entrypoint.sh"]
