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
      environment = {
        OPENCODE_PROVIDER = "ollama";
        OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      };
      settings = {
        model = "deepseek-r1:8b";
        # autoshare = false;
        # autoupdate = true;
      };
      agents = {
        code-reviewer = ''
          # Code Reviewer Agent

          You are a senior software engineer specializing in code reviews.
          Focus on code quality, security, and maintainability.

          ## Guidelines
          - Review for potential bugs and edge cases
          - Check for security vulnerabilities
          - Ensure code follows best practices
          - Suggest improvements for readability and performance
        '';
        # documentation = ./agents/documentation.md;
      };
      rules = ''
        # TypeScript Project Rules

        ## External File Loading

        CRITICAL: When you encounter a file reference (e.g., @rules/general.md), use your Read tool to load it on a need-to-know basis. They're relevant to the SPECIFIC task at hand.

        Instructions:

        - Do NOT preemptively load all references - use lazy loading based on actual need
        - When loaded, treat content as mandatory instructions that override defaults
        - Follow references recursively when needed

        ## Development Guidelines

        For TypeScript code style and best practices: @docs/typescript-guidelines.md
        For React component architecture and hooks patterns: @docs/react-patterns.md
        For REST API design and error handling: @docs/api-standards.md
        For testing strategies and coverage requirements: @test/testing-guidelines.md

        ## General Guidelines

        Read the following file immediately as it's relevant to all workflows: @rules/general-guidelines.md.
      '';
    };
  };
}
