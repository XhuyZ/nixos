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

