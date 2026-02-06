{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.ollama;
in
{
  options.systemd.ollama.enable = mkEnableOption "enable ollama";

  config = mkIf cfg.enable {
    services.open-webui = {
      enable = true;
      port = 11111;
      host = "0.0.0.0";
      openFirewall = true;
      environment = {
        # WEBUI_AUTH = "False";
        STATIC_DIR = "${config.services.open-webui.stateDir}/static";
        DATA_DIR = "${config.services.open-webui.stateDir}/data";
        HF_HOME = "${config.services.open-webui.stateDir}/hf_home";
        SENTENCE_TRANSFORMERS_HOME = "${config.services.open-webui.stateDir}/transformers_home";
      };
    };
    services.ollama = {
      enable = true;
      # loadModels = [
      #   "qwen2.5-coder:7b"
      #   "qwen2.5-coder:3b"
      #   "deepseek-r1:7b"
      # ];
      acceleration =
        # if config.services.xserver.videoDrivers == [ "amdgpu" ] then
        #   "rocm"
        # else if config.services.xserver.videoDrivers == [ "nvidia" ] then
        #   "cuda"
        # else null
        false;
      host = "[::]";
      openFirewall = true;
      environmentVariables = {
        OLLAMA_ORIGINS = "https://msty.studio";
        OLLAMA_HOST = "0.0.0.0";
        OLLAMA_NUM_THREADS = "12";
        OLLAMA_HOME = "/home/xhuyz/ollama-data";
      };
    };
    nixpkgs.config = {
      # rocmSupport = config.services.xserver.videoDrivers == [ "amdgpu" ];
      # cudaSupport = config.services.xserver.videoDrivers == [ "nvidia" ];
      cudaSupport = false;
      rocmSupport = false;
    };
  };
}
