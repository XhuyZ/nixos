{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.qutebrowser;
in
{
  options.features.wm.qutebrowser.enable = mkEnableOption "Qutebrowser";

  config = mkIf cfg.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = {
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&amp;go=Go&amp;ns0=1";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://wiki.nixos.org/index.php?search={}";
        g = "https://www.google.com/search?hl=en&amp;q={}";
      };
      settings = {
        colors = {
          hints = {
            bg = "#000000";
            fg = "#ffffff";
          };
          tabs.bar.bg = "#000000";
        };
        tabs.tabs_are_windows = true;
      };
    };
  };
}
