{ config, ... }:
{
  age = {
    secrets = {
      identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
      laptop-asus-password = {
        file = ../../secrets/laptop-asus-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
