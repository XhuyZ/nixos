{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.qutebrowser;
in
{
  options.features.gui.qutebrowser.enable = mkEnableOption "Qutebrowser";

  config = mkIf cfg.enable {
    programs.qutebrowser = {
      enable = true;

      searchEngines = {
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://search.nixos.org/packages?channel=25.11&query={}";
        g = "https://www.google.com/search?q={}";
      };

      settings = {
        colors = {
          hints = {
            bg = mkForce "#000000";
            fg = mkForce "#ffffff";
          };

          tabs = {
            bar = {
              bg = mkForce "#000000";
            };
          };
        };

        tabs.tabs_are_windows = false;
      };
    };
  };
}
