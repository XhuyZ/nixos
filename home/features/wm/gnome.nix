{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.wm.gnome;
in {
  options.features.wm.gnome.enable = 
    mkEnableOption "GNOME desktop environment with custom configuration";

  config = mkIf cfg.enable {
    # Install GNOME extensions
    home.packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.just-perfection
      gnomeExtensions.logo-menu
      # gnomeExtensions.aylurs-widgets
      gnomeExtensions.top-bar-organizer
      gnomeExtensions.space-bar
      gnomeExtensions.gtile
    ];

    # GNOME configuration via dconf
    dconf.settings = {
      # Shell configuration
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
        ];
        disable-user-extensions = false;
        enabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
          "dash-to-dock@micxgx.gmail.com"
          "just-perfection-desktop@just-perfection"
          "Logo-menu@aryan_k"
          "aylurs-widgets@aylur"
          "top-bar-organizer@julian.gse.jsts.xyz"
          "space-bar@luchrioh"
          "gtile@vibou"
        ];
      };

      # Desktop interface
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      # Background and screensaver
      "org/gnome/desktop/background" = {
        picture-uri = "file:///usr/share/backgrounds/gnome/adwaita-l.webp";
        picture-uri-dark = "file:///usr/share/backgrounds/gnome/adwaita-d.webp";
      };

      "org/gnome/desktop/screensaver" = {
        picture-uri = "file:///usr/share/backgrounds/gnome/adwaita-l.webp";
        picture-uri-dark = "file:///usr/share/backgrounds/gnome/adwaita-d.webp";
      };

      # Touchpad
      "org/gnome/desktop/peripherals/touchpad" = {
        disable-while-typing = false;
      };

      # Window manager
      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
      };

      # Workspace keybindings
      "org/gnome/desktop/wm/keybindings" = {
        # Workspace switching
        switch-to-workspace-1 = ["<Control><Alt>1"];
        switch-to-workspace-2 = ["<Control><Alt>2"];
        switch-to-workspace-3 = ["<Control><Alt>3"];
        switch-to-workspace-4 = ["<Control><Alt>4"];
        switch-to-workspace-5 = ["<Control><Alt>5"];
        switch-to-workspace-6 = ["<Control><Alt>6"];
        switch-to-workspace-7 = ["<Control><Alt>7"];
        switch-to-workspace-8 = ["<Control><Alt>8"];
        switch-to-workspace-9 = ["<Control><Alt>9"];
        switch-to-workspace-10 = ["<Control><Alt>0"];

        # Moving windows to workspaces
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        move-to-workspace-5 = ["<Shift><Super>5"];
        move-to-workspace-6 = ["<Shift><Super>6"];
        move-to-workspace-7 = ["<Shift><Super>7"];
        move-to-workspace-8 = ["<Shift><Super>8"];
        move-to-workspace-9 = ["<Shift><Super>9"];
        move-to-workspace-10 = ["<Shift><Super>0"];

        # Application switching
        switch-to-application-1 = ["<Super>1"];
        switch-to-application-2 = ["<Super>2"];
        switch-to-application-3 = ["<Super>3"];
        switch-to-application-4 = ["<Super>4"];
        switch-to-application-5 = ["<Super>5"];
        switch-to-application-6 = ["<Super>6"];
        switch-to-application-7 = ["<Super>7"];
        switch-to-application-8 = ["<Super>8"];
        switch-to-application-9 = ["<Super>9"];
        switch-to-application-10 = ["<Super>0"];

        # Directional workspace switching
        move-to-workspace-right = ["<Shift><Super>Right" "<Shift><Super>l"];
        move-to-workspace-left = ["<Shift><Super>Left" "<Shift><Super>h"];
        switch-to-workspace-right = ["<Control><Alt>Right" "<Control><Alt>l"];
        switch-to-workspace-left = ["<Control><Alt>Left" "<Control><Alt>h"];

        # Application switching
        switch-applications = ["<Super><Tab>"];
        switch-applications-backward = ["<Shift><Super><Tab>"];
      };

      # Mutter settings
      "org/gnome/mutter" = {
        edge-tiling = false;
        dynamic-workspaces = false;
      };

      # Extension configurations
      "org/gnome/shell/extensions/dash-to-dock" = {
        autohide = true;
        dock-fixed = false;
        dock-position = "BOTTOM";
        pressure-threshold = 200.0;
        require-pressure-to-show = true;
        show-favorites = true;
        hot-keys = false;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        panel-size = 48;
        activities-button = false;
      };

      "org/gnome/shell/extensions/Logo-menu" = {
        hide-softwarecentre = true;
        menu-button-icon-click-type = 3;
        menu-button-icon-image = 23;
        menu-button-terminal = "gnome-terminal";
      };

      "org/gnome/shell/extensions/aylurs-widgets" = {
        background-clock = false;
        battery-bar = false;
        dash-board = false;
        date-menu-date-format = "%H:%M  %B %m";
        date-menu-hide-clocks = true;
        date-menu-hide-system-levels = true;
        date-menu-hide-user = true;
        date-menu-indicator-position = 2;
        media-player = false;
        media-player-prefer = "firefox";
        notification-indicator = false;
        power-menu = false;
        quick-toggles = false;
        workspace-indicator = false;
      };

      "org/gnome/shell/extensions/top-bar-organizer" = {
        left-box-order = [
          "menuButton"
          "activities"
          "dateMenu"
          "appMenu"
        ];
        center-box-order = ["Space Bar"];
        right-box-order = [
          "keyboard"
          "EmojisMenu"
          "wireless-hid"
          "drive-menu"
          "vitalsMenu"
          "screenRecording"
          "screenSharing"
          "dwellClick"
          "a11y"
          "quickSettings"
        ];
      };

      "org/gnome/shell/extensions/space-bar/shortcuts" = {
        enable-activate-workspace-shortcuts = false;
      };

      "org/gnome/shell/extensions/space-bar/behavior" = {
        show-empty-workspaces = false;
      };

      "org/gnome/shell/extensions/gtile" = {
        show-icon = false;
      };
    };
  };
}
