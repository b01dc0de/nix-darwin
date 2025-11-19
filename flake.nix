{
  description = "b01dc0de / nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    addlCfg = { pkgs, ... }: {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
  in
  {
    # $ darwin-rebuild build --flake .
    darwinConfigurations.ecuador = nix-darwin.lib.darwinSystem {
      modules = [
        addlCfg
        ./configuration.nix
      ];
    };
  };
}
