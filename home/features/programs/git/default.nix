{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.programs.git;
in
{
  options.features.programs.git.enable = mkEnableOption "enable git config";

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        user.name = "XhuyZ";
        user.email = "xhuyzdev@gmail.com";
        init.defaultBranch = "main";
      };
    };
  };
}
