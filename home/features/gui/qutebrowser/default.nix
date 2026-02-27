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
        # -- WORKFLOW
        xhuyz = "open -t https://facebook.com ;; open -t https://youtube.com ;; open -t https://drive.google.com ;; open -t https://mail.google.com ;; open -t https://github.com ;; open -t https://search.nixos.org ;; open -t https://chatgpt.com ;; open -t https://hub.docker.com ;; open -t https://crates.io";
        q = "quit";
        w = "session-save";
        wq = "quit --save";

        gh = "open -t https://github.com";
        fb = "open -t https://facebook.com";
        yt = "open -t https://youtube.com";
        nt = "open -t https://www.notion.so";
        ggd = "open -t https://drive.google.com";
        e = "open -t https://mail.google.com";
        gpt = "open -t https://chatgpt.com";
        dh = "open -t https://hub.docker.com";
      };
      settings = {
        content.blocking.enabled = true;
        content.blocking.method = "adblock";
        tabs = {
          position = mkForce "left";
        };
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
