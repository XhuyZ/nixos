{
  age = {
    identityPaths = [ "/home/xhuyz/.ssh/id_ed25519" ];

    secrets = {
      grafana-username = {
        file = ../../secrets/grafana-username.age;
        owner = "root";
      };

      grafana-password = {
        file = ../../secrets/grafana-password.age;
        owner = "root";
      };

      forgejo-runner-token = {
        file = ../../secrets/forgejo-runner-token.age;
        owner = "root";
      };
    };
  };
}
