{ config, inputs, outputs, lib, pkgs, ... }:

{
  imports = [
    ../common
    ./configuration.nix
    ./programs.nix
    # ./secrets.nix
    ./services
  ];

  extraServices = {
    flatpak.enable = true;
    ollama.enable = true;
    podman.enable = true;
    virtualisation.enable = true;
  };
}
