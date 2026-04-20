{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.opencode;
in
{
  options.features.cli.opencode.enable = mkEnableOption "enable opencode";
  config = mkIf cfg.enable {
    programs.opencode = {
      enable = true;
      settings = lib.mkForce {
        plugin = [ "oh-my-openagent" ];
        formatter = {
          alejandra = {
            command = [
              "alejandra"
              "-q"
              "-"
            ];
            extensions = [ ".nix" ];
          };
        };
        provider = {
          ollama = {
            npm = "@ai-sdk/openai-compatible";
            name = "Ollama Local";
            options.baseURL = "http://127.0.0.1:11434/v1";
            models = {
              "qwen2.5:3b" = {
                name = "Qwen 2.5 3B";
                limit = {
                  context = 32768;
                  output = 8192;
                };
              };
            };
          };
        };
        model = "ollama/qwen2.5:3b";
      };
    };
  };
}
