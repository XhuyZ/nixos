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
  };
}
