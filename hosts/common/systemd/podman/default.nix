{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.podman;
in
{
  options.systemd.podman.enable = mkEnableOption "enable podman";

  config = mkIf cfg.enable {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
          flags = [
            "--filter=until=24h"
            "--filter=label!=important"
          ];
        };
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    environment.systemPackages = with pkgs; [
      podman-compose
    ];
  };
}
