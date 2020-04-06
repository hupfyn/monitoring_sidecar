
cat /opt/telegraf.conf | envsubst > /etc/telegraf/telegraf.conf
cat /opt/promtail.conf | envsubst > /etc/promtail/promtail.yaml

sudo service telegraf restart
promtail -config.file=/etc/promtail/promtail.yaml

echo =============== Ready ======================