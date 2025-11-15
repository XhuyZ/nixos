{pkgs, ...}: {
  imports = [
    ./disko-config.nix
    # ./hardware-configuration.nix
  ];
  # networking.hostName = "vps"; # CHANGE ME.
  # networking.hostId = "2768272b";
  # networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  # Set your time zone.
  users.users = {
  xhuyz = {
    isNormalUser = true;
    initialPassword = "<><>";
    extraGroups = [ "wheel" "networkmanager" ]; 
  };
};

  
  # networking version 2
  networking = {
    hostName = "vps";
    useDHCP = true; 
    firewall.allowedTCPPorts = [ 22 80 443 ];
    firewall.enable = true;
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [neovim git neofetch];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # settings.PermitRootLogin = "no";
    # settings = {
    #   PasswordAuthentication = false;
    # };
  };
  # networking.firewall.allowedUDPPorts = [ ... ]; Or disable the firewall altogether.

  system.stateVersion = "25.05"; # Did you read the comment?
}

