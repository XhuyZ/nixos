# Common configuration for all hosts

{
  lib,
  inputs,
  outputs,
  ...
}:
{
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "xhuyz"
      ]; # Set users that are allowed to use the flake command
      # Cache configuration - optimized for Asia
      # substituters = [
      #   "https://mirror.sjtu.edu.cn/nix-channels/store" # Shanghai Jiao Tong University - best for Asia
      #   "https://mirrors.ustc.edu.cn/nix-channels/store" # USTC backup mirror
      #   "https://cache.nixos.org" # Official global cache
      #   "https://nix-community.cachix.org" # Community packages
      #   # "https://hyprland.cachix.org"
      #   # "https://aseipp-nix-cache.global.ssl.fastly.net"
      # ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );
    nixPath = [ "/etc/nix/path" ];
  };
}
