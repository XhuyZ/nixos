{
  age = {
    identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
    ];

    secrets = {
      forgejo-runner-token = {
        file = ../../secrets/forgejo-runner-token.age;
        owner = "root";
      };
    };
  };
}
