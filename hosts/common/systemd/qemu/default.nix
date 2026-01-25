{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.qemu;
in
{
  options.systemd.qemu.enable = mkEnableOption "enable virtualisation";

  config = mkIf cfg.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };
    programs.virt-manager.enable = true;
    environment = {
      systemPackages = [ pkgs.qemu ];
    };
  };
}
