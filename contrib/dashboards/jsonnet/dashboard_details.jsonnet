
local grafana = import 'grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local singlestat = grafana.singlestat;
local graphPanel = grafana.graphPanel;
local heatmapPanel = grafana.heatmapPanel;
local table = grafana.table;
local prometheus = grafana.prometheus;
local template = grafana.template;

dashboard.new(
  schemaVersion=16,
  title="Flow-Logs to Metrics - Details",
  time_from="now-15m",
  tags=['flp','grafana','dashboard','details'],
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Bandwidth per network service",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_bandwidth_per_network_service[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Bandwidth per src and destination subnet",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_bandwidth_per_source_destination_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Bandwidth per source subnet",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_bandwidth_per_source_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per destinationIP /16 subnets",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_destination_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per sourceIP /16 subnets",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_source_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per TCPFlags",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_tcp_flags[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per destination AS",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_destination_as[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per source AS",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_source_as[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate of src / destination subnet occurences",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_count_per_source_destination_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Bandwidth per destination subnet",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_egress_per_destination_subnet[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Bandwidth per namespace",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_egress_per_namespace{aggregate=~".*Pod.*"}[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Connections rate per destinationIP geo-location",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_connections_per_destination_location[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Mice flows count",
  )
  .addTarget(
    prometheus.target(
      expr='rate(flp_mice_count{}[1m])',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Elephant flows count",
  )
  .addTarget(
    prometheus.target(
      expr='rate(flp_elephant_count{}[1m])',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)
.addPanel(
  graphPanel.new(
    datasource='prometheus',
    title="Network services connections rate",
  )
  .addTarget(
    prometheus.target(
      expr='topk(10,rate(flp_service_count[1m]))',
    )
  ), gridPos={
    x: 0,
    y: 0,
    w: 25,
    h: 20,
  }
)