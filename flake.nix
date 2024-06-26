{
  description = "NixOS configuration with Hyprland support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-compat = {
      url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-compat }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          (import ./hyprland-configuration.nix { inherit nixpkgs flake-compat; })
        ];
      };
    };
  };
}
