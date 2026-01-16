{ config, ... }:
{
  age = {
    secrets = {
      vps-password = {
        file = ../../secrets/vps-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
