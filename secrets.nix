let
  # SYSTEMS
  laptop-thinkpad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLhI8f9r78Jebj3OB9IWlPTDlygHXAznFqxGzULuqdq deploy-rs";
  orion = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFNPjUQbyiFjT6KwxiZ8LT++7jgLLRD9iPOga9FhKJyq";

  # USERS change from where using the agenix remote to
  users = [ laptop-thinkpad ];

  systems = [
    laptop-thinkpad
    orion
  ];
in
{
  "secrets/forgejo-runner-token.age".publicKeys = systems ++ users;
}
