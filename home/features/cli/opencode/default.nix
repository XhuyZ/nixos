{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.opencode;
in
{
  options.features.cli.opencode.enable = mkEnableOption "enable opencode";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [ opencode ];
    };
  };
}
