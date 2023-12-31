{
    description = "Home Manager configuration of ajlow";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-index-database.url = "github:Mic92/nix-index-database";
        nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { nixpkgs, home-manager, nix-index-database, ... }:
        let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        in {
            homeConfigurations = {
                ajlow = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [ 
                        ./users/ajlow.nix 
                        nix-index-database.hmModules.nix-index
                    ];
                };
            };
        };
}
