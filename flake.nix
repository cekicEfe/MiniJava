{
  description = "Cpp development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {

          nativeBuildInputs = [
            #
            pkgs.jdk
            pkgs.javaCup
            pkgs.jflex
            pkgs.jdt-language-server
          ];

          # Dependencies for project
          buildInputs = [
            #
          ];

          #links libraries to shell
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.javaCup pkgs.jdk ];

          shellHook = ''
            PS1="[\\u@\\h && CPP-DEV-ENV:\\w]\$ "
            export CUP_11B_RUN=${pkgs.javaCup}/share/java/java-cup-11b-runtime.jar
          '';
        };
      });
}
