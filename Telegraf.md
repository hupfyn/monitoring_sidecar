# Telegraf configuration example


```toml

[global_tags]
[agent]

#Default data collection interval for all inputs.
  interval = "5s"

  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  debug = false
  quiet = false

  #Override default hostname, if empty use os.Hostname()
  hostname = ""

### The InfluxDB output plugin writes metrics to the InfluxDB v1.x
[[outputs.influxdb]]

  ## The full HTTP for your InfluxDB instance.
  urls = ["https://your_influx:8086"]
  
  ## HTTP Basic Auth
  username = "some_dude"
  password = "s0me_pa$$"

  ## The target database for metrics;
  database = "telegraf"


### The jolokia2_agent input plugin reads JMX metrics 
### Example config for Java apps

[[inputs.jolokia2_agent]]
  urls = ["http://your_app_jolokia:8778/jolokia"]

  [[inputs.jolokia2_agent.metric]]
    name  = "java_runtime"
    mbean = "java.lang:type=Runtime"
    paths = ["Uptime"]

  [[inputs.jolokia2_agent.metric]]
    name  = "java_memory"
    mbean = "java.lang:type=Memory"
    paths = ["HeapMemoryUsage", "NonHeapMemoryUsage", "ObjectPendingFinalizationCount"]

  [[inputs.jolokia2_agent.metric]]
    name     = "java_garbage_collector"
    mbean    = "java.lang:name=*,type=GarbageCollector"
    paths    = ["CollectionTime", "CollectionCount"]
    tag_keys = ["name"]

  [[inputs.jolokia2_agent.metric]]
    name     = "java_last_garbage_collection"
    mbean    = "java.lang:name=*,type=GarbageCollector"
    paths    =    ["LastGcInfo/duration", "LastGcInfo/GcThreadCount", "LastGcInfo/memoryUsageAfterGc"]
    tag_keys = ["name"]

  [[inputs.jolokia2_agent.metric]]
    name  = "java_threading"
    mbean = "java.lang:type=Threading"
    paths = ["TotalStartedThreadCount", "ThreadCount", "DaemonThreadCount", "PeakThreadCount"]

  [[inputs.jolokia2_agent.metric]]
    name  = "java_class_loading"
    mbean = "java.lang:type=ClassLoading"
    paths = ["LoadedClassCount", "UnloadedClassCount", "TotalLoadedClassCount"]

  [[inputs.jolokia2_agent.metric]]
    name     = "java_memory_pool"
    mbean    = "java.lang:name=*,type=MemoryPool"
    paths    = ["Usage", "PeakUsage", "CollectionUsage"]
    tag_keys = ["name"]

```