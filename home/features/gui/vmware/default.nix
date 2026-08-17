{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.vmware;
in
{
  options.features.gui.vmware.enable = mkEnableOption "vmware worksation";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      vmware-workstation
    ];
  };
}
