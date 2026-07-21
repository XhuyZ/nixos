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
    postgresql.enable = true;
    tailscale.enable = true;
    incus.enable = true;
    forgejo.enable = true;
    nginx.enable = true;
  };
}
