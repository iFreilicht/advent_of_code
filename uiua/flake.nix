{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.uiua = {
    url = "github:uiua-lang/uiua";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, uiua }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        uiua-pkg = uiua.packages.${system}.default;
      in {
        devShell = pkgs.mkShellNoCC {
          packages = [ uiua-pkg ];
        };
      });
}
