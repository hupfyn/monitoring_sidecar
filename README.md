# Sidecar monitoring container
The following monitoring tools present inside container
- telegraf 1.13.4 (metric agent)
- promtail 1.4.0  (log scraper agent)

## Config required

- path to telegraf:

```bash
   /opt/telegraf/telegraf.conf
```
- path to promtail:

```bash
   /opt/promtail/promtail.yaml
```

- path to log file
```bash
   /opt/log/
```

## How to run

1. Get container
```bash
   docker build -t monitoring-sidecar .
   ```
   or 
```bash
   docker pull hupfyn/monitoring_sidecar
   ```
2. Write config files


**Note:** There are you can see examples of [telegraf](./Telegraf.md) and [promtail](./Promtail.md) config files


3. To execute following command for starting container

```bash
   docker run -d --name monitoring-sidecar /
    -v path/to/config/telegraf:/opt/telegraf/telegraf.conf /
    -v path/to/config/promtail:/opt/promtail/promtail.yaml /
    -v path/to/your/file.log:/opt/log/log_name.log /
    monitoring-sidecar
   ```
