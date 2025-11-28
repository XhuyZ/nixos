{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.stateVersion = "25.05";
  home.file = {
  };
  home.username = lib.mkDefault "xhuyz";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  imports = [
    inputs.zen-browser.homeModules.beta
    inputs.stylix.homeModules.stylix
    inputs.nixcord.homeModules.nixcord
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
  stylix.image = ../../assets/wallpaper16-9.jpg;
  stylix.polarity = "dark";
  programs.home-manager.enable = true;
  programs.bash.shellAliases = {
    nvim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
    vim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
  };
}
