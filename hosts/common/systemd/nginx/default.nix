{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.nginx;
in
{
  options.systemd.nginx.enable = mkEnableOption "enable nginx";

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;
      virtualHosts.localhost = {
        locations."/" = {
          return = "200 '<html><body>It works</body></html>'";
          extraConfig = ''
            default_type text/html;
          '';
        };
      };
    };
  };
}
