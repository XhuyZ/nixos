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
    ../common/extraServices
  ];

  extraServices = {
    ollama.enable = true;
    # virtualisation.enable = true;
    podman.enable = true;
  };
}
