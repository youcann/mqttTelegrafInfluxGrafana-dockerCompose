# mqttTelegrafInfluxGrafana-dockerCompose
Demo of docker-compose and Grafana provisioning.

```bash
.
├── docker-compose.yml
├── generateSampleData.sh
├── grafana
│   ├── dashboards
│   │   └── mydashboard.json
│   └── provisioning
│       ├── dashboards
│       │   └── dashboard.yml
│       ├── datasources
│       │   └── datasource.yml
│       └── notifiers
├── influxdb
├── run.sh
└── telegraf
    └── telegraf.conf
```



### Functionality

This project allows collecting data from (IOT-) sensors via MQTT and displaying it with Grafana. 

One main goal was to reduce the need for manual installation of packages and the configuring of the back end and the Dashboard to a minimum. By using docker-compose and Grafana provisioning, a first working solution is achieved by running a single command.

In more detail:

* _eclipse-mosquitto_ provides a MQTT broker to accept messages.

* _Telegraf_ together with the mqtt_consumer plugin is used to gather incomming MQTT messages and relaying them to influxdb.
* _Influxdb_ is used to store the data as time series.
* _Grafana_ is used to display the data.

### Prerequisites 

Docker and Docker-compose should be installed on your system.

### Running

Run

```bash
chmod +x run.sh
./run.sh
```

or run

```bash
docker-compose up -d
```

to run it in the background.

Then open `localhost:3000` in your browser.

### Testing

Run

```bash
./generateSampleData.sh
```

and watch the graphs in the default dashboard to fill with data.