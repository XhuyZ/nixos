{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.litellm;

in
{
  options.systemd.litellm.enable = mkEnableOption "enable litellm";

  config = mkIf cfg.enable {
    services.litellm = {
      enable = true;
    };
  };
}
