{
  description = "Pedro's Dotfiles";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };
  outputs = { self, nixpkgs, }:
    let system = "x86_64-linux";
    in {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
}