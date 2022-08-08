{
  description = "Articblush gtk theme";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          articblush-gtk = pkgs.stdenv.mkDerivation rec {
            pname = "articblush-gtk";
            version = "0.1.0";
            src = ./.;
            installPhase = ''
              mkdir -p $out/share/themes/
              cp -r Articblush $out/share/themes/
            '';
          };
        };
        defaultPackage = packages.articblush-gtk;
      });
}
