{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.rust;
in
{
  options.features.devkit.rust.enable = mkEnableOption "Rust";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
      wasm-pack
      python314
      gnumake
      crates-tui
      cargo-info
      crate2nix
    ];
  };
}
