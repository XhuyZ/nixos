{pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
    ensureDatabases = [
      "ghost"
      "matomo"
    ];
    initialScript = pkgs.writeText "initial-script.sql" ''
      CREATE USER 'ghost'@'10.89.%' IDENTIFIED BY 'ghost';
      GRANT ALL PRIVILEGES ON ghost.* TO 'ghost'@'10.89.%';

      CREATE USER 'matomo'@'10.89.%' IDENTIFIED BY 'matomo';
      GRANT ALL PRIVILEGES ON matomo.* TO 'matomo'@'10.89.%'; '';
  };
  services.mysqlBackup = {
    enable = true;
    calendar = "03:00:00";
    databases = ["ghost" "matomo"];
  };
  networking.firewall = {
    extraCommands = ''
      iptables -A INPUT -p tcp -s 127.0.0.1 --dport 3306 -j ACCEPT
      iptables -A INPUT -p tcp -s 10.89.0.0/24 --dport 3306 -j ACCEPT
    '';
  };
}

