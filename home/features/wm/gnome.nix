{ config, lib, pkgs, ... }:
let
  cfg = config.features.wm.gnome;
in {
  options.features.wm.gnome.enable =
    lib.mkEnableOption "GNOME desktop environment customization";

  config = lib.mkIf cfg.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
        ];
        disable-user-extensions = false;
        enabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      "org/gnome/desktop/background" = {
        picture-uri = "${pkgs.khanelinix.wallpapers}/share/wallpapers/flatppuccin_macchiato.png";
        picture-uri-dark = "${pkgs.khanelinix.wallpapers}/share/wallpapers/cat-sound.png";
      };

      "org/gnome/desktop/screensaver" = {
        picture-uri = "${pkgs.khanelinix.wallpapers}/share/wallpapers/flatppuccin_macchiato.png";
        picture-uri-dark = "${pkgs.khanelinix.wallpapers}/share/wallpapers/cat-sound.png";
      };

      "org/gnome/mutter" = {
        edge-tiling = false;
        dynamic-workspaces = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
      };

      "org/gnome/desktop/wm/keybindings" = {
        "move-to-workspace-right" = [ "<Shift><Super>Right" "<Shift><Super>l" ];
        "move-to-workspace-left"  = [ "<Shift><Super>Left" "<Shift><Super>h" ];
        "switch-to-workspace-right" = [ "<Control><Alt>Right" "<Control><Alt>l" ];
        "switch-to-workspace-left"  = [ "<Control><Alt>Left" "<Control><Alt>h" ];
        "switch-applications" = [ "<Super><Tab>" ];
        "switch-applications-backward" = [ "<Shift><Super><Tab>" ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        autohide = true;
        dock-fixed = false;
        dock-position = "BOTTOM";
        pressure-threshold = 200.0;
        require-pressure-to-show = true;
        show-favorites = true;
        hot-keys = false;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        panel-size = 48;
        activities-button = false;
      };

      # ... thêm các extension khác ở đây
    };
  };
}

