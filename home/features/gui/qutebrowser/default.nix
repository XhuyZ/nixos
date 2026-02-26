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

      settings = {
        colors = {
          webpage = {
            bg = "#002b36";
          };

          hints = {
            bg = "#b58900";
            fg = "#002b36";
          };

          statusbar = {
            normal = {
              bg = "#002b36";
              fg = "#839496";
            };
            insert = {
              bg = "#268bd2";
              fg = "#002b36";
            };
            command = {
              bg = "#073642";
              fg = "#839496";
            };
          };

          tabs = {
            bar.bg = "#002b36";

            even = {
              bg = "#073642";
              fg = "#839496";
            };

            odd = {
              bg = "#073642";
              fg = "#839496";
            };

            selected = {
              bg = "#268bd2";
              fg = "#002b36";
            };
          };
        };

        tabs.tabs_are_windows = true;
      };
      # settings = {
      #   colors = {
      #     hints = {
      #       bg = mkForce "#000000";
      #       fg = mkForce "#ffffff";
      #     };
      #
      #     tabs = {
      #       bar = {
      #         bg = mkForce "#000000";
      #       };
      #     };
      #   };
      #
      #   tabs.tabs_are_windows = false;
      # };
    };
  };
}
