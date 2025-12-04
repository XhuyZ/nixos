# nixos

My multi host NixOS configuration
ok

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

configuration.nix hostID : openssl rand -hex 4

{d7742d87-e61d-4b78-b8a1-b469842139fa
{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}

