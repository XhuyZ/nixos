{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programs.gh;
in {
  options.features.programs.gh.enable = mkEnableOption "enable starship prompt";

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
      extensions = [
       pkgs.gh-eco
      ];
    };
  };
}



