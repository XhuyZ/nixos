{ pkgs, ... }:
{
  imports = [
    ./nodejs.nix
    ./dotnet_10.nix
    ./dotnet_9.nix
    ./dotnet_8.nix
  ];

}
