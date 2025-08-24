{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.flatpak;
in {
  options.extraServices.flatpak.enable = mkEnableOption "enable flatpak";

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
    xdg.portal = {
      # xdg desktop intergration (required for flatpak)
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
      config.common.default = "*";
    };
  };
}

