{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.zen-browser;
in
{
  options.features.wm.zen-browser.enable = mkEnableOption "enable zen-browser";

  config = mkIf cfg.enable {
    programs = {
      zen-browser = {
        enable = true;
        nativeMessagingHosts = [ pkgs.firefoxpwa ];
      };
    };
  };
}
