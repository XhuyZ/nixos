{pkgs, ...}: {
  imports = [
   ./office.nix
   ./blender.nix
   ./kdenlive.nix
   ./obs.nix
   ./dbeaver.nix
   ./media.nix
   ./gnome.nix
  ];

}

