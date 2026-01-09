{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.dotnet_8;
in
{
  options.features.devkit.dotnet_8.enable = mkEnableOption "Dotnet 8";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnetCorePackages.sdk_8_0-bin
      dotnet-ef
    ];
  };
}
