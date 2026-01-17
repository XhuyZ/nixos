{ config, ... }:
{
  age = {
    identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
    secrets = {
      laptop-asus-password = {
        file = ../../secrets/laptop-asus-password.age;
        owner = "xhuyz";
      };
    };
  };
}
