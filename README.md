# nixos-iot-edge

**NixOS module for IoT data ingestion**

## The idea

Fediversity nodes and other NixOS hosts often need to ingest sensor data
locally: an MQTT broker, a time-series store, and a small API to query it.
Today that means hand-wiring Mosquitto, a database, and glue code on every
machine. This project proposes a single declarative NixOS module —
`services.iot-edge` — that does it in one block of configuration, with a
choice of storage backend (SQLite for small deployments, InfluxDB or
TimescaleDB for larger ones).

```nix
services.iot-edge = {
  enable = true;
  database.backend = "sqlite"; # or influxdb / timescaledb
};
```

This repository holds the design and early groundwork. See
[docs/ROADMAP.md](docs/ROADMAP.md) for the planned phases.

## Why this gap

In the projects we have looked at, no reusable, declarative NixOS module
covers IoT/edge data collection — existing setups (Mosquitto + Telegraf + InfluxDB, wired by hand) are
assembled per-machine with no shared, tested module.

## Status

Early-stage: architecture drafted; a private proof of concept exists. Not a
public package yet — see [docs/ROADMAP.md](docs/ROADMAP.md) for the planned
phases.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) — feedback on the design in
[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) is the most useful
contribution at this stage.

## License

[MIT](LICENSE)
