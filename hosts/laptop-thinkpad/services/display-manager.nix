{ pkgs, ... }:
{
  services.displayManager = {
    enable = true;
    defaultSession = "mango";
    sddm = {
      enable = true;
      wayland = {
        enable = true;
      };
      extraPackages = [
        pkgs.sddm-astronaut
      ];
      theme = "sddm-astronaut-theme";
    };
  };
}
