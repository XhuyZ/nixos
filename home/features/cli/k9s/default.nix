{
  config,
  lib,
  pkgs,

  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.features.cli.k9s;
in
{
  options.cli.programs.k9s = {
    enable = lib.mkEnableOption "k9s";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      helmfile
      kubecolor
      kubectl
      kubectx
      kubelogin
      kubernetes-helm
      kubeseal
    ];

    programs = {
      k9s = {
        enable = true;
        package = pkgs.k9s;

        settings.k9s = {
          liveViewAutoRefresh = true;
          refreshRate = 1;
          maxConnRetry = 3;
          ui = {
            enableMouse = true;
          };
        };
      };
    };
  };
}
