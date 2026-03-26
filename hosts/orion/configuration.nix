{
  config,
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ./secrets.nix
  ];
  # fileSystems."/mnt/storage" = {
  #   device = "UUID=41ec7247-4e14-448a-b6c8-1ac2449dae7e";
  #   fsType = "btrfs";
  #   options = [
  #     "compress=zstd"
  #     "noatime"
  #     "nofail"
  #     "x-systemd.device-timeout=10s"
  #   ];
  # };
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
  ];
  hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia = {
  #   open = false;
  #   package = config.boot.kernelPackages.nvidiaPackages.beta;
  #   modesetting.enable = true;
  #   prime = {
  #     offload.enable = true;
  #     offload.enableOffloadCmd = true;
  #
  #     intelBusId = "PCI:0:2:0";
  #     nvidiaBusId = "PCI:1:0:0";
  #   };
  # };
  # hardware.bluetooth.enable = true;
  boot.loader = {
    efi.canTouchEfiVariables = false;

    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      efiInstallAsRemovable = true;
    };
  };
  ## --- Kernel ---
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.network.enable = true;
  boot.initrd.network.udhcpc.enable = true;
  boot.initrd.network.postCommands = ''
    ip addr add 192.168.1.50/24 dev eno1
    ip route add default via 192.168.1.1
  '';
  boot.initrd.network.ssh = {
    enable = true;
    port = 2222;
    authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLhI8f9r78Jebj3OB9IWlPTDlygHXAznFqxGzULuqdq deploy-rs"
    ];
    hostKeys = [
      # "/etc/secrets/initrd/ssh_host_rsa_key"
      "/etc/secrets/initrd/ssh_host_ed25519_key"
    ];
  };
  ## --- Host & Time ---
  time.timeZone = "Asia/Ho_Chi_Minh";

  ## --- Locale ---
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  ## --- GUI: GNOME Desktop --
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.libinput.enable = true;

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  ## --- Printing ---
  # services.printing.enable = true;

  ## --- Sound (PipeWire) ---
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;

  #   ## --- User ---
  users.mutableUsers = false;
  users.users = {
    xhuyz = {
      isNormalUser = true;
      initialPassword = "<><>";
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "incus"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLhI8f9r78Jebj3OB9IWlPTDlygHXAznFqxGzULuqdq deploy-rs"
      ];
      packages = [ inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
  };
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.xhuyz = import ../../home/xhuyz/${config.networking.hostName}.nix;
  };

  ## --- Unfree packages ---
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "gradle-7.6.6"
  ];
  ## --- System packages ---
  environment.systemPackages = with pkgs; [
    inputs.my-nixvim.packages.${stdenv.hostPlatform.system}.default
    inputs.agenix.packages.${stdenv.hostPlatform.system}.default
    git
    neofetch
  ];

  ## --- Sudo config ---
  # security.sudo.extraRules = [
  #   {
  #     groups = [ "sudo" ];
  #     commands = [ "ALL" ];
  #   }
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  ## --- Required for upgrades ---
  system.stateVersion = "25.11";
}
