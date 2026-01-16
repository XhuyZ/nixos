{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.office;
in
{
  options.features.gui.office.enable = mkEnableOption "install office and paperwork stuff";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-fresh
    ];
  };
}
