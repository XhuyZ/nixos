{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.openssh;

in
{
  options.systemd.openssh.enable = mkEnableOption "enable openssh";

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 22 ];

    services.openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        PubkeyAuthentication = true;
      };
    };
  };
}
