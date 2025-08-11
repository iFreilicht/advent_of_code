{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/459104f841356362bfb9ce1c788c1d42846b2454"; # Uiua 0.3.1
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShellNoCC {
          packages = [ pkgs.uiua ];
        };
      }
    );
}
