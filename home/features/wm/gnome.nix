{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.gnome;
in
{
  options.features.wm.gnome.enable =
    mkEnableOption "GNOME desktop environment with custom configuration";

  config = mkIf cfg.enable {
    # Install GNOME extensions
    home.packages = with pkgs; [
      gnomeExtensions.paperwm
    ];

    # GNOME configuration via dconf
    dconf.settings = {
      # Shell configuration
      # "org/gnome/shell" = {
      #   favorite-apps = [
      #     "org.gnome.Nautilus.desktop"
      #     "org.gnome.Console.desktop"
      #   ];
      disable-user-extensions = false;
      enabled-extensions = [
        "paperwm@paperwm.github.com"
      ];
    };

    # Touchpad
    # "org/gnome/desktop/peripherals/touchpad" = {
    #   disable-while-typing = false;
    # };

    # Window manager
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 5;
    };

    # Workspace keybindings
    # "org/gnome/desktop/wm/keybindings" = {
    #   # Workspace switching
    #   switch-to-workspace-1 = [ "<Super>1" ];
    #   switch-to-workspace-2 = [ "<Super>2" ];
    #   switch-to-workspace-3 = [ "<Super>3" ];
    #   switch-to-workspace-4 = [ "<Super>4" ];
    #   switch-to-workspace-5 = [ "<Super>5" ];
    #   switch-applications = [ "<Super><Tab>" ];
    #   switch-applications-backward = [ "<Shift><Super><Tab>" ];
    # };
  };
}
