{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.copyq;
in
{
  options.features.cli.copyq.enable = mkEnableOption "Clipboard";

  config = mkIf cfg.enable {
    services.copyq.enable = true;
  };
}
