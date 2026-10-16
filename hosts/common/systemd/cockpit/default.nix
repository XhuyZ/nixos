{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.qemu;
in
{
  options.systemd.cockpit.enable = mkEnableOption "enable cockpit";

  config = mkIf cfg.enable {
    services.cockpit = {
      enable = true;
      port = 9090;
      plugins = [
        pkgs.cockpit-files
        pkgs.cockpit-podman
        pkgs.cockpit-machines
      ];
      openFirewall = true; # Please see the comments section
      settings = {
        WebService = {
          # AllowUnencrypted = true; # 2026-08-04: Not needed anymore?
          Origins = lib.mkForce "http://localhost:9090 https://localhost:9090";
        };
      };
    };
  };
}
