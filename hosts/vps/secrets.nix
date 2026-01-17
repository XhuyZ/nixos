{ config, ... }:
{
  age = {
    secrets = {
      vps-password = {
        identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
        file = ../../secrets/vps-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
