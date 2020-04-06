# Promtail configuration example


```yaml
# Configures the server for Promtail.
server:
    http_listen_port: 9080
    grpc_listen_port: 0  
# Describes how to save read file offsets to disk
positions:
   filename: /tmp/positions.yaml
# Your loki endpoint
clients:
  url: "http://your_loki:3100/loki/api/v1/push"


scrape_configs:
    - job_name: app-logs
      entry_parser: raw
      static_configs:
        # Configures the discovery to look on the current machine.
        # Must be either localhost or the hostname of the current computer.
       - targets:
          - localhost
        # Defines a file to scrape and an optional set of additional labels
        # to apply to all streams defined by the files from __path__.
        labels:
            __path__: /opt/log/app/application.log.*
            # Additional labels to assign to the logs
            job: application-runtime
            some_your_staff: some_your_staff

    - job_name: nginx
      entry_parser: raw
      static_configs:
      - targets:
          - localhost
        labels:
          __path__: /opt/log/nginx/*log
          job: nginx-proxy
```