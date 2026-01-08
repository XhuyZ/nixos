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
    home.packages = with pkgs; [
      qutebrowser
    ];
    programs.qutebrowser = {
      searchEngines = {
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&amp;go=Go&amp;ns0=1";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://wiki.nixos.org/index.php?search={}";
        g = "https://www.google.com/search?hl=en&amp;q={}";
      };
    };
  };
}
