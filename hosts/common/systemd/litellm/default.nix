{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.litellm;
in
{
  options.systemd.litellm.enable = mkEnableOption "enable litellm";

  config = mkIf cfg.enable {
    services.litellm = {
      enable = true;
      # 🌐 expose ra ngoài nếu cần (cẩn thận security)
      host = "0.0.0.0";
      port = 4000;
      openFirewall = true;
      # 📁 nơi lưu state
      stateDir = "/var/lib/litellm";

      # 🔐 load API key từ file (khuyến nghị)
      # environmentFile = "/var/lib/secrets/litellm.env";

      environment = {
        LITELLM_LOG = "DEBUG";
      };
      # 🧠 config chính (YAML inline)
      settings = {
        model_list = [
          {
            model_name = "local";
            litellm_params = {
              model = "ollama/qwen2.5:3b";
            };
          }
          {
            model_name = "claude";
            litellm_params = {
              model = "anthropic/claude-3";
              api_key = "os.environ/ANTHROPIC_API_KEY";
            };
          }
          {
            model_name = "auto";
            litellm_params = {
              model = "anthropic/claude-3";
              api_key = "os.environ/ANTHROPIC_API_KEY";
            };
          }
        ];
        fallbacks = [
          {
            auto = [ "ollama/qwen2.5:3b" ];
          }
        ];
      };
    };
  };
}
