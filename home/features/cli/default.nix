{ pkgs, ... }:
{
  imports = [
    ./fastfetch/default.nix
    ./gh/default.nix
    ./cava/default.nix
    ./btop/default.nix
    ./jq/default.nix
    ./lazydocker/default.nix
    ./k9s/default.nix
    ./git/default.nix
    ./fcitx5/default.nix
    ./copyq/default.nix
    ./opencode/default.nix
  ];
}
