{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.greetd;
in
{
  options.systemd.greetd = {
    enable = mkEnableOption "enable greetd with mango session";

    user = mkOption {
      type = types.str;
      default = "xhuyz";
      description = "User to auto-login with greetd";
    };

    command = mkOption {
      type = types.str;
      default = "mango";
      description = "Session command for greetd";
    };
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          user = cfg.user;
          command = cfg.command;
        };
        default_session = {
          user = cfg.user;
          command = cfg.command;
        };
      };
    };
  };
}
