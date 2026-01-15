{ pkgs, ... }:
{
  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      wayland = {
        enable = true;
      };
      theme = "sddm-astronaut-theme";
    };
  };
}
