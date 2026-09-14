# nixos-iot-edge

**A declarative NixOS module for self-hosted IoT sensing and actuation**

## The idea

NixOS hosts often need to ingest sensor data locally — and, increasingly,
act on it: an MQTT broker, a time-series store, an API to query it, and a
way to safely drive actuators from what it reads. Today that means
hand-wiring Mosquitto, a database, and glue code on every machine, with no
declarative or safe way to close the loop from sensor to actuator. This
project proposes a single declarative NixOS module — `services.iot-edge`
— that does it in one block of configuration, with a choice of storage
backend.

```nix
services.iot-edge = {
  enable = true;
  database.backend = "sqlite"; # or timescaledb
};
```

This repository holds the design and early groundwork for a funding
proposal to NLnet (European Commission Next Generation Internet
programme). See [docs/ROADMAP.md](docs/ROADMAP.md) for what the
requested funding delivers.

## Why this gap

No reusable, declarative NixOS module exists for this — existing setups
(Mosquitto + Telegraf + InfluxDB, wired by hand) are assembled
per-machine with no shared, tested module, and no safe, declarative path
from reading a sensor to acting on it.

## Status

Design phase. This repository holds the architecture and public design;
see [docs/ROADMAP.md](docs/ROADMAP.md) for the delivery plan this
proposal funds.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) — feedback on the design in
[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) is the most useful
contribution at this stage.

## License

[MIT](LICENSE)
