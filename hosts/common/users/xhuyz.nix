{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.xhuyz = {
    #initialHashedPassword = "$y$j9T$IoChbWGYRh.rKfmm0G86X0$bYgsWqDRkvX.EBzJTX.Z0RsTlwspADpvEF3QErNyCMC";
    initialPassword = "<><>";
    isNormalUser = true;
    description = "xhuyz";
    # openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUl+Ct7pxo23Ueo2pdKSMrpCGjeEkYKzkmuSDTi6p3C xhuyzdev@gmail.com"
    # ];
    };

    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
      "adbusers"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.xhuyz =
    import ../../../home/xhuyz/${config.networking.hostName}.nix;
}

