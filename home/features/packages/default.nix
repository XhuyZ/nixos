{pkgs, my-nixvim, system, inputs,  ...}: {
  home.packages = with pkgs; [
    pkgs.neofetch
    pkgs.pfetch
    pkgs.htop
    pkgs.neovim
    pkgs.git
    pkgs.vim
    pkgs.cmatrix
    pkgs.fzf
    pkgs.nushell
    pkgs.libgcc
    pkgs.tree
    pkgs.zig_0_12
    pkgs.starship
    pkgs.lazysql
    pkgs.dbeaver-bin
    pkgs.gcc
    ];
}


