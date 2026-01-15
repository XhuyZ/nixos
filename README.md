#My multi host NixOS configuration(laptop-thinkpad,laptop-asus,wsl,vm)

## Laptop-asus

![Preview Screenshot](/assets/laptop-asus.png)

## Laptop-thinkpad

![Preview Screenshot](/assets/laptop-thinkpad.png)

nmtui
ping google.com
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/disk-config.nix
cd ~
git clone https://github.com/XhuyZ/nixos
