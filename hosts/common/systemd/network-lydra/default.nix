{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.network-lydra;

in
{
  options.systemd.network-lydra.enable = mkEnableOption "enable networking";
  config = mkIf cfg.enable {
    ## --- Networking ---
    networking.hostName = "lydra";
    networking.useDHCP = false;

    ## ip a to show which interfaces
    networking.interfaces.eno1 = {
      ipv4.addresses = [
        {
          address = "192.168.1.40";
          prefixLength = 24;
        }
      ];
    };
    ## open module
    # networking.interfaces.enp3s0 = {
    #   ipv4.addresses = [
    #     {
    #       address = "192.168.10.1";
    #       prefixLength = 24;
    #     }
    #   ];
    # };

    networking.defaultGateway = "192.168.1.1";

    networking.nameservers = [
      # "127.0.0.1"
      "1.1.1.1"
      "8.8.8.8"
    ];
    # networking.networkmanager.dns = "none";
    networking.networkmanager.enable = false;
    ## --- Firewall ---
    networking.firewall.allowedTCPPorts = [
      # Http
      80
      # Udp
      53
      # ssh
      22
      443
    ];
    networking.firewall.allowedUDPPorts = [
      53
    ];
  };
}
