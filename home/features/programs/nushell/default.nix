{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.features.programs.nushell;
in
{
  options.features.programs.nushell.enable = mkEnableOption "enable nushell";

  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      envFile.text = ''
                $env.config.show_banner = false
                # $env.NIX_PATH = "nixpkgs=channel:nixos-unstable"
                # $env.NIX_LOG = "iunfo"
                # $env.WEBKIT_DISABLE_COMPOSITING_MODE = "1"
                $env.TERMINAL = "kitty"
                $env.EDITOR = "nvim"
        				$env.SHELL = "nu"
                # $env.VISUAL = "zed"
                # $env.FZF_DEFAULT_COMMAND = "fd --type f --exclude .git --follow --hidden"
                # $env.FZF_DEFAULT_OPTS = "--preview='bat --color=always -n {}' --bind 'ctrl-/:toggle-preview' --header 'Press CTRL-Y to copy command into clipboard' --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort' --color bg:#282a36,bg+:#44475a,fg:#f8f8f2,fg+:#f8f8f2,header:#6272a4,hl:#bd93f9,hl+:#bd93f9,info:#ffb86c,marker:#ff79c6,pointer:#ff79c6,prompt:#50fa7b,spinner:#ffb86c"
                # $env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
                # $env.FZF_DEFAULT_COMMAND = "fd --type f --exclude .git --follow --hidden"
                # $env.SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh"
                # $env.FLAKE = $"($env.HOME)/p/nixos/nixos-config"
                # source /run/agenix/${config.home.username}-secrets
                # $env.JAVA_HOME = "/usr/lib/jvm/java-8-temurin/"
                # Set the Android SDK root
                $env.ANDROID_SDK_ROOT = "/home/xhuyz/Android/Sdk"
                # Append Android tools to PATH
                $env.PATH = ($env.PATH | append [
                "/home/xhuyz/Android/Sdk/cmdline-tools/bin/"
                "/home/xhuyz/Android/Sdk/build-tools"
                "/home/xhuyz/Android/Sdk/emulator"
                "/home/xhuyz/Android/Sdk/platform-tools"
                "/home/xhuyz/Android/Sdk/system-images"
                ])
                #install fcitx5 -gtk -qt 
                $env.GTK_IM_MODULE = "fcitx"
                $env.QT_IM_MODULE = "fcitx"
                $env.XMODIFIERS = "@im=fcitx"
                #gemini-api-key
      '';
      configFile.text = ''
                    print "\e[6 q"
              $env.KOMOREBI_CONFIG_HOME = ($env.Path | prepend 'C:\Users\xhuyz\.config\komorebi')
              $env.config.show_banner = false
              $env.config.buffer_editor = "nvim"
              $env.PROMPT_COMMAND_RIGHT = ""
              $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = null
              $env.ENV_CONVERSIONS = $env.ENV_CONVERSIONS | merge {
                  "XDG_DATA_DIRS": {
                      from_string: {|s| $s | split row (char esep) | path expand --no-symlink }
                      to_string: {|v| $v | path expand --no-symlink | str join (char esep) }
                  }
              }
              $env.config.color_config.filesize = {|x| if $x == 0b { 'dark_gray' } else if $x < 1mb { 'cyan' } else { 'blue' } }
              $env.config.color_config.bool = {|x| if $x { 'green' } else { 'light_red' } }
              # mkdir ($nu.data-dir | path join "vendor/autoload")
              # starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
              alias edit = sudo nvim /etc/nixos/configuration.nix
              alias xhuyz = sudo nixos-rebuild switch
              alias home = cd ~/.config/home-manager/
              alias niriconfig = nvim ~/.config/niri/config.kdl
        #update system
              alias xhuyz-asus = sudo nixos-rebuild switch --flake .#laptop-asus
        #fastfetch
              alias ff = fastfetch
        #service
              alias serman = bash ~/bash-scripts/services-manager.sh
              alias waydroid-enable = sudo systemctl enable waydroid-container.service
              alias waydroid-disable = sudo systemctl disable waydroid-container.service
              alias waydroid-status = sudo systemctl status waydroid-container.service
              alias waydroid-start = sudo systemctl start waydroid-container.service
              alias waydroid-restart = sudo systemctl restart waydroid-container.service
              alias waydroid-stop = sudo systemctl stop waydroid-container.service
              alias mysql-enable = sudo systemctl enable mysqld
              alias mysql-disable = sudo systemctl disable mysqld
              alias mysql-status = sudo systemctl status mysqld
              alias mysql-start = sudo systemctl start mysqld
              alias mysql-restart = sudo systemctl restart mysqld
              alias mysql-stop = sudo systemctl stop mysqld
              alias mssql-enable = sudo systemctl enable mssql-server
              alias mssql-disable = sudo systemctl disable mssql-server
              alias mssql-status = sudo systemctl status mssql-server
              alias mssql-start = sudo systemctl start mssql-server
              alias mssql-restart = sudo systemctl restart mssql-server
              alias mssql-stop = sudo systemctl stop mssql-server
              alias docker-enable = sudo systemctl enable docker
              alias docker-disable = sudo systemctl disable docker
              alias docker-status = sudo systemctl status docker
              alias docker-start = sudo systemctl start docker
              alias docker-restart = sudo systemctl restart docker
              alias docker-stop = sudo systemctl stop docker containerd
              alias tlp-enable = sudo systemctl enable tlp
              alias tlp-disable = sudo systemctl disable tlp
              alias tlp-status = sudo systemctl status tlp
              alias tlp-start = sudo systemctl start tlp
              alias tlp-restart = sudo systemctl restart tlp
              alias tlp-stop = sudo systemctl stop tlp
        #dotnetrun
              alias dr = dotnet run
        #start dbeaver with x11 windowing system
              alias dbeaver = with-env { GDK_BACKEND: "x11" } { dbeaver }
        #scaffold dotnet
              alias scaffold = dotnet ef dbcontext scaffold "Server=localhost;Database=Spring2025HandbagDB;User Id=sa;Password=Wenhui35@;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models
              alias scaffold2 = dotnet ef dbcontext scaffold "Server=localhost;Database=FootballMatchAppDB;User Id=sa;Password=Wenhui35@;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Context --output-dir Entities --context FootballMatchAppContext
        #tmux 
              alias aegis-reset = tmux kill-session -t Aegis+
              alias aegis = tmuxp load ~/.tmuxp/aegis.yaml
              alias basico = tmuxp load ~/.tmuxp/basico.yaml
              alias fma = tmuxp load ~/.tmuxp/fma.yaml
              alias connect = sqlcmd -S localhost -U sa -C -P 'Wenhui35@' -i ~/sql-scripts/Spring2025HandbagDB.sql
              alias reboot = sudo systemctl reboot
              alias off = sudo systemctl poweroff
        # start postgres docker
              alias psqldocker = sudo docker run --name postgres -e POSTGRES_PASSWORD=Wenhui35@ -p 5432:5432 -d postgres
      '';
    };
  };
}
