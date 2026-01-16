{ pkgs, ... }:
{
  imports = [
    ./kitty/default.nix
    ./nushell/default.nix
    ./starship/default.nix
  ];
}
