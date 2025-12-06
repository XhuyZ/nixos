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
    ../common/extraServices
    ./configuration.nix
    ./programs.nix
    # ./secrets.nix
    ./services
  ];

  extraServices = {
    podman.enable = true;
    # virtualisation.enable = true;
  };
}
