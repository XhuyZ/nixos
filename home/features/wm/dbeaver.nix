{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.wm.dbeaver;
in {
  options.features.wm.dbeaver.enable =
    mkEnableOption "Dbeaver database client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    dbeaver-bin
    ];
  };
}


