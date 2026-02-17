{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.gns3;
in
{
  options.features.gui.gns3.enable = mkEnableOption "Dbeaver database client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gns3-gui
      gns3-server
    ];
  };
}
