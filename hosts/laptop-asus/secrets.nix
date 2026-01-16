{ config, ... }:
{
  age = {
    secrets = {
      laptop-asus-password = {
        file = ../../secrets/laptop-asus-password.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}
