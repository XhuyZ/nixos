{
  imports = [
    ../common
    ./configuration.nix
    ./programs.nix
    ./services
    ../common/systemd
  ];

  systemd = {
    ollama.enable = true;
    qemu.enable = true;
    podman.enable = true;
    #adjust
    postgresql.enable = true;
    grafana.enable = true;
    prometheus.enable = true;
    n8n.enable = true;
    incus.enable = true;
    traefik.enable = true;
    wireguard.enable = true;
    nginx.enable = true;
  };
}
