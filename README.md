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
sudo mkfs.vfat -F32 /dev/nvme0n1p1
sudo mkfs.ext4 /dev/nvme0n1p2
sudo mount /dev/nvme0n1p2 /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/nvme0n1p1 /mnt/boot
cd ~
git clone https://github.com/XhuyZ/nixos Flake
cd Flake
mkdir -p tmp
sudo mkdir -p /mnt/tmp
sudo TMPDIR=$PWD/tmp nixos-install --flake .#laptop-asus

configuration.nix hostID : openssl rand -hex 4
