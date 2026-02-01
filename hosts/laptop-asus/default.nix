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
    # Container Management
    podman.enable = true;
    # Databases
    postgresql.enable = true;
    # Monitoring
    grafana.enable = true;
    prometheus.enable = true;
    # Automation workflows
    n8n.enable = true;
    # VMs + System container
    incus.enable = true;
    qemu.enable = true;
    # VPN
    wireguard.enable = true;
    # Reverse Proxy
    nginx.enable = true;
    traefik.enable = false;
    # DNS server
    pihole.enable = false;
    coredns.enable = true;
  };
}
