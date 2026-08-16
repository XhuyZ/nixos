{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.stateVersion = "26.05";
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
    # inputs.zen-browser.homeModules.beta
    inputs.stylix.homeModules.stylix
    inputs.nixcord.homeModules.nixcord
    inputs.mangowc.hmModules.mango
  ];
  stylix = {
    enable = false;
    targets.gtk.enable = false;
    targets.qt.enable = false;
    image = ../../assets/laptop-thinkpad.png;
    polarity = "dark";
  };

  programs.home-manager.enable = true;
  programs.bash.shellAliases = {
    nvim = "${inputs.my-nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nvim";
    vim = "${inputs.my-nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nvim";
  };
}
