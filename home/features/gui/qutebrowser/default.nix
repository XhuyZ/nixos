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
      aliases = {
        q = "quit";
        w = "session-save";
        wq = "quit --save";
        gh = "open https://github.com";
        fb = "open https://facebook.com";
        yt = "open https://youtube.com";
        nt = "open https://www.notion.so";
        ggd = "open https://drive.google.com";
        e = "open https://mail.google.com";
      };
      programs.qutebrowser.quickmarks = {
        gh = "https://github.com";
        fb = "https://facebook.com";
        nixpkgs = "https://github.com/NixOS/nixpkgs";
        yt = "https://youtube.com";
        drive = "https://drive.google.com";
        mail = "https://mail.google.com";
        notion = "https://notion.so";
        dh = "https://hub.docker.com";
      };
      settings = {
        colors = {
          hints = {
            bg = mkForce "#b58900";
            fg = mkForce "#002b36";
          };

          tabs = {
            bar = {
              bg = mkForce "#002b36";
            };
          };
        };
        tabs.tabs_are_windows = false;
      };
    };
  };
}
