{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.golang;
in
{
  options.features.devkit.golang.enable = mkEnableOption "Golang";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      go
    ];
  };
}
