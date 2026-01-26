{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.n8n;

in
{
  options.systemd.n8n.enable = mkEnableOption "enable n8n";
  config = mkIf cfg.enable {
    services.n8n = {
      enable = true;
      openFirewall = true;
    };
  };
}
