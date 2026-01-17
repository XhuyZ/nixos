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
  ];
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
  ];
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia.open = true;
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
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
  boot.kernelModules = [ "iwlwifi" ];

  ## --- Host & Time ---
  networking.hostName = "laptop-asus";
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

  ## --- Networking ---
  networking.networkmanager.enable = true;

  ## --- GUI: GNOME Desktop --
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.wayland = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.libinput.enable = true;
  ## --- NVIDIA

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  ## --- Printing ---
  # services.printing.enable = true;
  hardware.bluetooth.enable = true;
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
  users.users = {
    xhuyz = {
      isNormalUser = true;
      hashedPasswordFile = config.age.secrets.laptop-asus-password.path;
      extraGroups = [
        "wheel"
        "networkmanager"
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
    inputs.my-nixvim.packages.${system}.default
    inputs.agenix.packages.${system}.default
    git
    neofetch
  ];

  ## --- SSH ---
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  ## --- Firewall ---
  networking.firewall.allowedTCPPorts = [ 22 ];

  ## --- Sudo config ---
  security.sudo.extraRules = [
    {
      groups = [ "sudo" ];
      commands = [ "ALL" ];
    }
  ];

  ## --- Required for upgrades ---
  system.stateVersion = "25.11";
}
