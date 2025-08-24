{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;
    extensions = with pkgs.postgresql17Packages; [
      pgvector
    ];
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
}

