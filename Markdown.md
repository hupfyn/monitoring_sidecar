# Sidecar monitoring container
The next monitor tool are exist here:
- telegraf 1.13.4 (metric agent)
- promtail 1.4.0  (log scraper agent)

## Config required

- path for telegraf:

```bash
   /opt/telegraf/telegraf.conf
```
- path for promtail:

```bash
   /opt/promtail/promtail.yaml
```

- path to log file
```bash
   /opt/log/
```

## How to run

1. Build container
```bash
   docker build -t monitoring-sidecar
   ```
2. Write config files


**Note:** You can see example of [telegraf](./Telegraf.md) and [promtail](./Promtail.md)


3. Execute using following comand

```bash
   docker run -d --name monitoring-sidecar /
    -v path/to/config/telegraf:/opt/telegraf/telegraf.conf /
    -v path/to/config/promtail:/opt/promtail/promtail.yaml /
    -v path/to/your/file.log:/opt/log/log_name.log /
    monitoring-sidecar
   ```
