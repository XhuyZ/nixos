{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programs.lazydocker;
in {
  options.features.programs.lazydocker.enable = mkEnableOption "enable lazydocker";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [ lazydocker ];

      shellAliases = {
        # #
        # Docker aliases
        # #
        dcd = "docker-compose down";
        dcu = "docker-compose up -d";
        dim = "docker images";
        dps = "docker ps";
        dpsa = "docker ps -a";
        dsp = "docker system prune --all";
      };
    };
  };
}



