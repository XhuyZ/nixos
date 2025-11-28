{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.devkit.dotnet_9;
in
{
  options.features.devkit.dotnet_9.enable = mkEnableOption "Dotnet 9";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnetCorePackages.sdk_9_0-bin
    ];
  };
}
