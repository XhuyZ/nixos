{
  description = ''
    XhuyZ multihost flake
  '';
  inputs = {
    nixpkgs-25-05.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim.url = "github:nix-community/nixvim";
    my-nixvim.url = "github:XhuyZ/nixvim";
    agenix.url = "github:ryantm/agenix";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    mangowc = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
  };
  outputs =
    {
      self,
      home-manager,
      nixpkgs-25-05,
      nixpkgs,
      nixos-hardware,
      nixvim,
      my-nixvim,
      agenix,
      mangowc,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      overlays = import ./hosts/overlays { inherit inputs; };
      nixosConfigurations = {
        vps = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/vps
            # ./modules/duckdns.nix
            inputs.disko.nixosModules.disko
            agenix.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
        laptop-asus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/laptop-asus
            # ./modules/duckdns.nix
            inputs.disko.nixosModules.disko
            # nixos-hardware.nixosModules.asus-fx504gd
            agenix.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "backup";
            }
            mangowc.nixosModules.mango
          ];
        };
        laptop-thinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/laptop-thinkpad
            # ./modules/duckdns.nix
            inputs.disko.nixosModules.disko
            nixos-hardware.nixosModules.lenovo-thinkpad-t14s
            agenix.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "backup";
            }
            mangowc.nixosModules.mango
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/wsl
            inputs.home-manager.nixosModules.home-manager
            inputs.nixos-wsl.nixosModules.wsl
            {
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
      homeConfigurations = {
        # Change networking.hostName option if want to change the hostname of the current system
        "xhuyz@vps" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/xhuyz/vps.nix
          ];
        };
        "xhuyz@laptop-asus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/xhuyz/laptop-asus.nix
          ];
        };
        "xhuyz@laptop-thinkpad" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/xhuyz/laptop-thinkpad.nix
          ];
        };
        "xhuyz@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/xhuyz/wsl.nix
          ];
        };
      };
    };
}
