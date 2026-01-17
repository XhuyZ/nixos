{ config, ... }:
{
  age = {
    identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];
    secrets = {
      laptop-thinkpad-password = {
        file = ../../secrets/laptop-thinkpad-password.age;
        owner = "xhuyz";
      };
    };
  };
}
