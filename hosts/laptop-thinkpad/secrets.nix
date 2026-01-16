{ config, ... }:
{
  age = {
    secrets = {
      laptop-thinkpad-password = {
        file = ../../secrets/laptop-thinkpad-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
