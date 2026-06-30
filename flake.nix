{
  description = "astraeavalentina's nix-darwin system (ported from Marin-Kitagawa's NixOS + home-manager configs)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
    }:
    let
      hostname = "a";
      username = "astraeavalentina";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs username; };
        modules = [
          ./darwin.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "before-hm";
            home-manager.users.${username} = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs username; };
          }
        ];
      };
    };
}
