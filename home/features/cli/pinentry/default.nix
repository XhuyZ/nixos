{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.pinentry;
in
{
  options.features.cli.pinentry.enable = mkEnableOption "enable pinentry";

  config = mkIf cfg.enable {
    programs.password-store = {
      enable = true;
      package = pkgs.pass-wayland.withExtensions (exts: [
        exts.pass-otp
        exts.pass-import
      ]);
    };
    home.packages = with pkgs; [ pinentry ];
  };
}
