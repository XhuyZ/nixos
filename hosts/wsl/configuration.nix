{
  config,
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}:
{
  wsl.enable = true;
  wsl.wslConf = {
    interop.appendWindowsPath = false;
  };
  wsl.defaultUser = "xhuyz";
  ## --- Host & Time ---
  networking.hostName = "wsl";
  time.timeZone = "Asia/Ho_Chi_Minh";
  ## --- Locale ---
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.xhuyz = import ../../home/xhuyz/${config.networking.hostName}.nix;
  };
  ## --- Unfree packages ---
  nixpkgs.config.allowUnfree = true;
  ## --- System packages ---
  environment.systemPackages = with pkgs; [
    inputs.my-nixvim.packages.${system}.default
    git
    neofetch
  ];

  ## --- SSH ---
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  ## --- Firewall ---
  networking.firewall.allowedTCPPorts = [
    22
    8080
  ];

  ## --- Sudo config ---
  security.sudo.extraRules = [
    {
      groups = [ "sudo" ];
      commands = [ "ALL" ];
    }
  ];

  system.stateVersion = "25.11";
}
