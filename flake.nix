{
  description = "Kaz's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      hermes-agent,
      ...
    }:
    let
      mkHome =
        { system, enableHermes }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            inherit hermes-agent enableHermes;
          };
          modules = [
            ./home.nix
          ];
        };
    in
    {
      homeConfigurations = {
        # Default config for Phantom: shared config + Hermes.
        kaz-phantom = mkHome {
          system = "x86_64-linux";
          enableHermes = true;
        };

        # Specter gets the exact same shared config without Hermes.
        kaz-specter = mkHome {
          system = "aarch64-linux";
          enableHermes = false;
        };
      };
    };
}
