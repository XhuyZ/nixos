{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.ollama;
in {
  options.extraServices.ollama.enable = mkEnableOption "enable ollama";

  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration =
        if config.services.xserver.videoDrivers == ["amdgpu"]
        then "rocm"
        else if config.services.xserver.videoDrivers == ["nvidia"]
        then "cuda"
        else null;
      host = "[::]";
      openFirewall = true;
      environmentVariables = {
        OLLAMA_ORIGINS = "https://msty.studio";
        OLLAMA_HOST = "0.0.0.0";
      };
    };
    nixpkgs.config = {
      rocmSupport = config.services.xserver.videoDrivers == ["amdgpu"];
      cudaSupport = config.services.xserver.videoDrivers == ["nvidia"];
    };
  };
}

