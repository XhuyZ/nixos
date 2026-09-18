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
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
  ];
  hardware.graphics.enable = true;
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
  boot.kernelPackages = pkgs.linuxPackages;
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
      # openssh.authorizedKeys.keys = [
      #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICmZeHieg2fNiH50P1CIRXWcGKCIbNLZjNIpIOdl4fRm"
      #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBDtDroKCGlMCx5QwYlO809l56GppbDhKtzerFO0b+9 thinkpad"
      # ];
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
  ];

  ## --- Sudo config ---
  # security.sudo.extraRules = [
  #   {
  #     groups = [ "sudo" ];
  #     commands = [ "ALL" ];
  #   }
  security.acme = {
    acceptTerms = true;
    defaults.email = "xhuyzdev@gmail.com";
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  ## --- Required for upgrades ---
  system.stateVersion = "26.05";
}
