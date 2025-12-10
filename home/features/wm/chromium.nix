{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.chromium;
in
{
  options.features.wm.chromium.enable = mkEnableOption "Enable chromium ";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      chromium
    ];
    programs.chromium.extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      {
        id = "dcpihecpambacapedldabdbpakmachpb";
        updateUrl = "https://raw.githubusercontent.com/iamadamdev/bypass-paywalls-chrome/master/updates.xml";
      }
      {
        id = "aaaaaaaaaabbbbbbbbbbcccccccccc";
        crxPath = "/home/share/extension.crx";
        version = "1.0";
      }
    ];

  };
}
