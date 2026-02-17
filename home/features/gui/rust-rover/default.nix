{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.rustrover;
in
{
  options.features.gui.rustrover.enable = mkEnableOption "Dbeaver database client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.rust-rover
    ];
  };
}
