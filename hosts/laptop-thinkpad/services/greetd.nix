{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "mango";
        # user = "xhuyz";
      };
      default_session = initial_session;
    };
  };
}
