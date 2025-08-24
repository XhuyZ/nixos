{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programs.jq;
in {
  options.features.programs.jq.enable = mkEnableOption "enable jq";

  config = mkIf cfg.enable {
    programs.jq = {
          enable = true;
          package = pkgs.jq;
        };
      };
}



