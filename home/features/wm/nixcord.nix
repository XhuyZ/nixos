{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.nixcord;
in
{
  options.features.wm.nixcord.enable = mkEnableOption "Discord for NixOS";

  config = mkIf cfg.enable {
    programs.nixcord = {
      enable = true; # Enable Nixcord (It also installs Discord)
      discord = {
        vencord.enable = true; # Use Vencord (default)
        # equicord.enable = true;  # Or use Equicord instead (cannot enable both)
      };
      vesktop.enable = true; # Vesktop
      equibop.enable = true; # Equibop
      dorion.enable = true; # Dorion
      quickCss = "some CSS"; # quickCSS file
      config = {
        useQuickCss = true; # use out quickCSS
        themeLinks = [
          # or use an online theme
          "https://raw.githubusercontent.com/link/to/some/theme.css"
        ];
        frameless = true; # Set some Vencord/Equicord options
        # plugins = {
        #   hideAttachments.enable = true; # Enable a plugin (works with both Vencord and Equicord)
        #   ignoreActivities = {
        #     # Enable a plugin and set some options
        #     enable = true;
        #     ignorePlaying = true;
        #     ignoreWatching = true;
        #     ignoredActivities = [ "someActivity" ];
        #   };
        # };
      };
      dorion = {
        theme = "dark";
        zoom = "1.1";
        blur = "acrylic"; # "none", "blur", or "acrylic"
        sysTray = true;
        openOnStartup = true;
        autoClearCache = true;
        disableHardwareAccel = false;
        rpcServer = true;
        rpcProcessScanner = true;
        pushToTalk = true;
        pushToTalkKeys = [ "RControl" ];
        desktopNotifications = true;
        unreadBadge = true;
      };
      extraConfig = {
        # Some extra JSON config here
        # ...
      };
    };
  };
}
