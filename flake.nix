{
    description = "Dakotak's Nix Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ...} @ inputs:
    let
        inherit (self) outputs;
        inherit (nixpkgs) lib;
        specialArgs = { inherit inputs outputs nixpkgs; };
    in
    {
        nixosConfigurations = {
            xone = lib.nixosSystem {
                inherit specialArgs;
                system = "x86_64-linux";
                modules = [
                    home-manager.nixosModules.home-manager{
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = specialArgs;
                        home-manager.users.dakota = import ./nix/users/dakota;
                    }
                    ./nix/hosts/xone
                ];
            };
        };
    };
}
