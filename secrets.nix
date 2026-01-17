let
  # SYSTEMS
  laptop-asus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODfImvMQyIAGukCdFpoPjDK00H9o0T/ns6X1i62pnym";
  laptop-thinkpad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0yDi7KEb3BJ+K4WXscZDV/iuGGnoMNhClzEEz/iDtT";
  wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIyHuLITpI+M45ZZem33wDusY2X988mBoWpD1HDeZNRJ";
  vps = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjbaZU8KsJn70OssH7QGQ6ISOJJfykMjMLgUZzHzG1v";

  # USERS
  xhuyz = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3YEmpYbM+cpmyD10tzNRHEn526Z3LJOzYpWEKdJg8DaYyPbDn9iyVX30Nja2SrW4Wadws0Y8DW+Urs25/wVB6mKl7jgPJVkMi5hfobu3XAz8gwSdjDzRSWJrhjynuaXiTtRYED2INbvjLuxx3X8coNwMw58OuUuw5kNJp5aS2qFmHEYQErQsGT4MNqESe3jvTP27Z5pSneBj45LmGK+RcaSnJe7hG+KRtjuhjI7RdzMeDCX73SfUsal+rHeuEw/mmjYmiIItXhFTDn8ZvVwpBKv7xsJG90DkaX2vaTk0wgJdMnpVIuIRBa4EkmMWOQ3bMLGkLQeK/4FUkNcvQ/4+zcZsg4cY9Q7Fj55DD41hAUdF6SYODtn5qMPsTCnJz44glHt/oseKXMSd556NIw2HOvihbJW7Rwl4OEjGaO/dF4nUw4c9tHWmMn9dLslAVpUuZOb7ykgP0jk79ldT3Dv+2Hj0CdAWT2cJAdFX58KQ9jUPT3tBnObSF1lGMI7t77VU=";
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
