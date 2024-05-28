{
    description = "Dakotak's Nix Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";

        home-manager = {
            url = "nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs";
        }
    };

    outputs = { self, nixpkgs, home-manager, ...}:
    let
        inherit (nixpkgs) lib;
        specialArgs = { inherit inputs outputs nixpkgs; };
    in
    {
        nixosConfigurations = {
            xone = lib.nixosSystem {
                inherit specialArgs;
                system = "x86_64-linux";
                modules = [
                    ./nix/hosts/xone
                ];
            };
        };
    };
}