{pkgs, ...}: {
  imports = [
  ./kitty/default.nix
  ./nushell/default.nix
  ./starship/default.nix
  ./fastfetch/default.nix
  ./gh/default.nix
  ./cava/default.nix
  ./btop/default.nix
  ./jq/default.nix
  ./lazydocker/default.nix
  ./k9s/default.nix
  ];
}

