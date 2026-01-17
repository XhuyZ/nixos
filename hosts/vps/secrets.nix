{ config, ... }:
{
  age = {
    identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
    secrets = {
      vps-password = {
        file = ../../secrets/vps-password.age;
        owner = "xhuyz";
      };
    };
  };
}
