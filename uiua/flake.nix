{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/e6f23dc08d3624daab7094b701aa3954923c6bbb"; # Uiua 0.16.2
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.uiua = {
    url = "github:uiua-lang/uiua";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-utils.follows = "flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      uiua,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        uiua-pkg = uiua.packages.${system}.default;
      in
      {
        devShell = pkgs.mkShellNoCC {
          packages = [ uiua-pkg ];
        };
      }
    );
}
