{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.dbeaver;
in
{
  options.features.gui.dbeaver.enable = mkEnableOption "Dbeaver database client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dbeaver-bin
    ];
  };
}
