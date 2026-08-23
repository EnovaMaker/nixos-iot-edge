# nixos-iot-edge

**NixOS module for IoT data ingestion — proposed for NGI Fediversity**

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

This repository holds the design and early groundwork for the proposal
submitted to [NGI Fediversity](https://nlnet.nl/fediversity/) (NLnet,
European Commission Next Generation Internet programme). See
[docs/ROADMAP.md](docs/ROADMAP.md) for what the requested funding
delivers.

## Why this gap

No NGI Fediversity-funded project currently covers IoT/edge data
collection, and no reusable, declarative NixOS module exists for it —
existing setups (Mosquitto + Telegraf + InfluxDB, wired by hand) are
assembled per-machine with no shared, tested module.

## Status

Early-stage: architecture drafted, core approach validated in a local
proof of concept. Not a public package yet — see
[docs/ROADMAP.md](docs/ROADMAP.md) for the delivery plan this proposal
funds.

## Funding

Proposed to NGI Fediversity (NLnet), August 2026. Developed alongside
nixos-taler, proposed to NGI TALER — separate codebases, separate
protocol domains, neither depends on the other being funded.
  
## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) — feedback on the design in
[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) is the most useful
contribution at this stage.

## License

[MIT](LICENSE)
