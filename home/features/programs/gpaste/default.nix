{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.programs.gpaste;
in
{
  options.features.programs.gpaste.enable = mkEnableOption "enable gpaste";

  config = mkIf cfg.enable {
    programs.gpaste = {
      enable = true;
      package = pkgs.gpaste;
    };
  };
}
