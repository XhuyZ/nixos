let
  # SYSTEMS
  laptop-asus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODfImvMQyIAGukCdFpoPjDK00H9o0T/ns6X1i62pnym";
  laptop-thinkpad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0yDi7KEb3BJ+K4WXscZDV/iuGGnoMNhClzEEz/iDtT";
  wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIyHuLITpI+M45ZZem33wDusY2X988mBoWpD1HDeZNRJ";
  vps = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjbaZU8KsJn70OssH7QGQ6ISOJJfykMjMLgUZzHzG1v";

  # USERS change from where using the agenix remote to
  xhuyz = laptop-thinkpad;
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
  "secrets/laptop-thinkpad-password.age".publicKeys = systems ++ users;
  "secrets/laptop-asus-password.age".publicKeys = systems ++ users;
  "secrets/wsl-password.age".publicKeys = systems ++ users;
  "secrets/vps-password.age".publicKeys = systems ++ users;
}
