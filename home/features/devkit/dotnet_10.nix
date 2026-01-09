{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.dotnet_10;
in
{
  options.features.devkit.dotnet_10.enable = mkEnableOption "Dotnet 10";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnetCorePackages.sdk_10_0-bin
      dotnet-ef
    ];
  };
}
