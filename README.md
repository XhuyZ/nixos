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
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/disk-config.nix
cd ~
git clone https://github.com/XhuyZ/nixos Flake
cd Flake
mkdir -p tmp
sudo mkdir -p /mnt/tmp
sudo TMPDIR=$PWD/tmp nixos-install --flake .#laptop-asus

configuration.nix hostID : openssl rand -hex 4


# nixos-anywhere
`sudo nix run github:nix-community/nixos-anywhere -- --flake .#vps root@157.66.101.42`

sudo nix run github:nix-community/nixos-anywhere -- \
  --flake github:XhuyZ/nixos#vps \
  root@157.66.101.42

