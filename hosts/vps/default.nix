{
  config,
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../common
    ./configuration.nix
    ./programs.nix
    # ./secrets.nix
    ./services
    ../common/systemd
  ];

  systemd = {
    ollama.enable = true;
    # virtualisation.enable = true;
    podman.enable = true;
  };
}
