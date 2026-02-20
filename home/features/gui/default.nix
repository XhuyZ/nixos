{ pkgs, ... }:
{
  imports = [
    ./blender/default.nix
    ./chrome/default.nix
    ./dbeaver/default.nix
    ./firefox/default.nix
    ./kdenlive/default.nix
    ./media/default.nix
    ./nixcord/default.nix
    ./obs/default.nix
    ./office/default.nix
    ./qutebrowser/default.nix
    ./redisinsight/default.nix
    ./rider/default.nix
    ./teams-for-linux/default.nix
    ./zen-browser/default.nix
    ./packet-tracer/default.nix
    ./rust-rover/default.nix
    ./gns3/default.nix
    ./nautilus/default.nix
  ];
}
