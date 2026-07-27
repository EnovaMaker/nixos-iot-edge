# Architecture (design)

High-level approach — this is the design this proposal funds building out,
not a description of a finished system.

```
sensors --MQTT--> broker --> ingestion agent --> time-series store --> API
```

- **MQTT broker** — via NixOS's existing `services.mosquitto` module.
- **Ingestion agent** — subscribes to sensor topics, writes readings to
  the configured storage backend.
- **Storage backend** — pluggable: SQLite by default, InfluxDB or
  TimescaleDB for larger deployments.
- **REST API** — local read access to sensors and readings.

The exact NixOS options surface, MQTT topic conventions, and CLI are part
of what this proposal delivers — see [ROADMAP.md](ROADMAP.md).

## Open questions

- Sensor disconnection / backfill strategy — buffer locally vs. rely on
  MQTT QoS + retained messages — still open.

Feedback on this design is welcome via issues — see
[CONTRIBUTING.md](../CONTRIBUTING.md).
