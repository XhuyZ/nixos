{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.extraServices.virtualisation;
in
{
  options.extraServices.virtualisation.enable = mkEnableOption "enable virtualisation";

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
