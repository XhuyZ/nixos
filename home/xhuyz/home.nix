{ inputs, config, lib, pkgs, ... }:
{
  home.stateVersion = "25.05"; 
  home.file = {
  };
  home.username = lib.mkDefault "xhuyz";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.bash.shellAliases = {
    nvim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
    vim = "${inputs.my-nixvim.packages.${pkgs.system}.default}/bin/nvim";
  };
}

