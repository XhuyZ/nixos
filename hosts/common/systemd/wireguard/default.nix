{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.systemd.wireguard;
in
{
  options.systemd.wireguard.enable = mkEnableOption "enable WireGuard";

  config = mkIf cfg.enable {
    networking.useNetworkd = true;

    systemd.network = {
      enable = true;

      networks."50-wg0" = {
        matchConfig.Name = "wg0";

        address = [
          "10.10.99.2/32"
        ];
      };

      netdevs."50-wg0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg0";
        };

        wireguardConfig = {
          ListenPort = 13231;

          # sau này đưa vào agenix
          PrivateKeyFile = "/path/to/private-key";

          RouteTable = "main";
        };

        wireguardPeers = [
          {
            PublicKey = "ROUTEROS_PUBLIC_KEY";

            AllowedIPs = [
              "10.10.10.0/24"
              "10.10.20.0/24"
              "10.10.30.0/24"
              "10.10.40.0/24"
              "10.10.50.0/24"
            ];

            Endpoint = "YOUR_HOME_PUBLIC_IP:13231";

            PersistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
