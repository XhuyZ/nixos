{ config, ... }:
{
  age = {
    identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
    secrets = {
      grafana-username = {
        file = ../../secrets/grafana-username.age;
        owner = "xhuyz";
      };
      grafana-password = {
        file = ../../secrets/grafana-password.age;
        owner = "xhuyz";
      };
    };
  };
}
