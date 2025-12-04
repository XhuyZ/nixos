{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.programs.copyq;
in
{
  options.features.programs.copyq.enable = mkEnableOption "Clipboard";

  config = mkIf cfg.enable {
    services.copyq.enable = true;
  };
}
