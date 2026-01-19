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
    ./disko-config.nix
    ./hardware-configuration.nix
    ./secrets.nix
  ];
  users.mutableUsers = false;
  users.users = {
    xhuyz = {
      isNormalUser = true;
      initialPassword = "<><>";
      # hashedPasswordFile = config.age.secrets.vps.path;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      packages = [ inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
  };
  # Bootloader.
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking.hostName = "vps"; # CHANGE ME.
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.xhuyz = import ../../home/xhuyz/${config.networking.hostName}.nix;
  };
  networking.hostId = "c0ffee01"; # CHANGE ME
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  time.timeZone = "Asia/Ho_Chi_Minh";

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
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${system}.default
    inputs.my-nixvim.packages.${system}.default
    git
    neofetch
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?
}
