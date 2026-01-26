let
  # SYSTEMS
  laptop-asus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICgm3sX4DwDHljKd+YEMAzf4oq4cn0Y7CAVrgD2BkX+7";
  laptop-thinkpad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0yDi7KEb3BJ+K4WXscZDV/iuGGnoMNhClzEEz/iDtT";
  wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIyHuLITpI+M45ZZem33wDusY2X988mBoWpD1HDeZNRJ";
  vps = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjbaZU8KsJn70OssH7QGQ6ISOJJfykMjMLgUZzHzG1v";

  # USERS change from where using the agenix remote to
  xhuyz = laptop-asus;
  # xhuyz = laptop-asus;
  users = [ xhuyz ];

  systems = [
    laptop-asus
    laptop-thinkpad
    wsl
    vps
  ];
in
{
  "secrets/grafana-username.age".publicKeys = systems ++ users;
  "secrets/grafana-password.age".publicKeys = systems ++ users;
}
