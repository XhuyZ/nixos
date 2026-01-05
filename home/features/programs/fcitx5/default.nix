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

      fcitx5 = {
        addons = with pkgs; [
          fcitx5-bamboo
        ];

        settings.inputMethod = {
          GroupOrder."0" = "Default";

          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "bamboo";
          };

          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "bamboo";
        };
      };
    };
  };
}
