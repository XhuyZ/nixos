{ config, ... }:
{
  age = {
    secrets = {
      wsl-password = {
        file = ../../secrets/wsl-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
