{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.gpaste;
in
{
  options.features.cli.gpaste.enable = mkEnableOption "enable gpaste";

  config = mkIf cfg.enable {
    programs.gpaste = {
      enable = true;
      package = pkgs.gpaste;
    };
  };
}
