{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.forgejo-runner;

in
{
  options.systemd.forgejo-runner = {
    enable = mkEnableOption "enable forgejo actions runner";
  };

  config = mkIf cfg.enable {

    services.gitea-actions-runner = {
      package = pkgs.forgejo-runner;

      instances.default = {
        enable = true;

        name = "orion-runner";

        url = "https://git.xhuyz.me";

        tokenFile = config.age.secrets.forgejo-runner-token.path;

        labels = [
          "native:host"
        ];
      };
    };

  };
}
