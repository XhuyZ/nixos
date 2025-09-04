# nixos
My multi host NixOS configuration



systemctl start wpa_supplicant
wpa_cli
add_network
set_network 0 ssid ""
set_network 0 psk ""
enable_network 0
exit
ping google.com
git clone https://github.com/XhuyZ/nixos.git
sudo nixos-rebuild switch /home/nixos/nixos#laptop-asus
