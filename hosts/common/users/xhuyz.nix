{
  config,
  pkgs,
  inputs,
  ...
}:
{
  users.users.xhuyz = {
    initialPassword = "<><>";
    isNormalUser = true;
    description = "xhuyz";
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
    "incus-admin"
  ];
  packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
}
