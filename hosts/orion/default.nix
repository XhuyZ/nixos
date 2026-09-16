{
  imports = [
    ../common
    ./configuration.nix
    ./programs.nix
    ./services
    ../common/systemd
  ];

  systemd = {
    # LLM
    ollama.enable = true;
    postgresql.enable = true;
    nginx.enable = true;
    coredns.enable = true;
    openssh.enable = true;
    networking.enable = true;
    qemu.enable = true;
    podman.enable = true;
    grafana.enable = false;

    prometheus.enable = false;
    n8n.enable = false;
    incus.enable = false;
    wireguard.enable = false;
    traefik.enable = false;
    pihole.enable = false;
    glance.enable = false;
    netdata.enable = false;
    adguard.enable = false;
    tailscale.enable = false;
    forgejo.enable = false;
    forgejo-runner.enable = false;
  };
}
