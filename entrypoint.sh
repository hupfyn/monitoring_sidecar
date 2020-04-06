#!/bin/bash

cat /opt/telegraf/telegraf.conf > /etc/telegraf/telegraf.conf

sudo service telegraf restart
sudo promtail --config.file=/opt/promtail/promtail.yaml