#!/bin/bash

envsubst < /opt/telegraf/telegraf.conf > /etc/telegraf/telegraf.conf
envsubst < /opt/promtail/promtail.yaml > /etc/promtail/promtail.yaml

sudo service telegraf restart
sudo promtail --config.file=/etc/promtail/promtail.yaml
