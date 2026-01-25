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
    ../common/systemd
    ./configuration.nix
    ./programs.nix
    # ./secrets.nix
    ./services
  ];

  systemd = {
    podman.enable = true;
  };
}
