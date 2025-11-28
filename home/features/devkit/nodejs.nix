{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.nodejs;
in
{
  options.features.devkit.nodejs.enable = mkEnableOption "Nodejs 24";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs_24
    ];
  };
}
