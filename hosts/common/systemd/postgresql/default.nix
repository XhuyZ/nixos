{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.postgresql;

in
{
  options.systemd.postgresql.enable = mkEnableOption "enable postgresql";
  config = mkIf cfg.enable {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_18;
      # extensions = with pkgs.postgresql17Packages; [
      #   pgvector
      # ];
      authentication = ''
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust

        host all all 10.88.0.0/16 trust
        host all all 19.89.0.0/16 trust
      '';
      initialScript = pkgs.writeText "initialScript.sql" ''
        CREATE USER n8n WITH PASSWORD 'n8n';
        CREATE DATABASE n8n;
        GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n;
      '';
    };
  };
}
