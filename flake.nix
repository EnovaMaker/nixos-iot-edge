# =============================================================================
# nixos-iot-edge — flake skeleton (design phase)
#
# This is intentionally a skeleton: it declares the project's planned
# structure and gives contributors a dev shell to read/discuss the design
# docs in. It does not build or test anything yet — see docs/ROADMAP.md for
# what each output below will actually contain once implementation starts.
# =============================================================================
{
  description = "nixos-iot-edge: NixOS module for IoT data ingestion on Fediversity (design phase, no implementation yet)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        # -------------------------------------------------------------------
        # Planned outputs — not implemented yet (see docs/ROADMAP.md):
        #
        #   nixosModules.iot-edge   services.iot-edge.* NixOS module
        #                           (broker, database, api submodules)
        #   packages.iot-edge-cli   Rust CLI: serve, sensors, data, stats,
        #                           health, register, remove
        #   checks.iot-edge-test    NixOS VM integration test
        # -------------------------------------------------------------------

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            mosquitto # for poking at MQTT while discussing the design
            sqlite    # ditto for the storage backend discussion
          ];
        };
      });
}
