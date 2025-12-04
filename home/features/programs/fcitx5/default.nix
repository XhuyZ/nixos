{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.programs.fcitx5;
in
{
  options.features.programs.fcitx5.enable = mkEnableOption "enable fcitx5 config";

  config = mkIf cfg.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-bamboo # Vietnamese Telex / VNI
      ];
    };
  };
}
