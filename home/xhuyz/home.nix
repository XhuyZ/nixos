{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.stateVersion = "25.11";
  home.file = {
  };
  home.username = lib.mkDefault "xhuyz";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.sessionVariables = {
    EDITOR = "nvim";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";
  };
  imports = [
    inputs.zen-browser.homeModules.beta
    inputs.stylix.homeModules.stylix
    inputs.nixcord.homeModules.nixcord
  ];
  stylix.enable = true;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
  stylix.image = ../../assets/wallpaper16-9-3.png;
  stylix.polarity = "dark";
  stylix.targets.zen-browser.profileNames = [
    "default"
  ];
  stylix.targets = {
    gtk.enable = false;
  };

  programs.home-manager.enable = true;
  programs.bash.shellAliases = {
    nvim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
    vim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
  };
}
