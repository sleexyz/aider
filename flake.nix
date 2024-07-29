{
  inputs = { flake-utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; overlays = [ ]; };
        in
        with pkgs; {
          devShell = mkShell {
            name = "devEnvironment";
            buildInputs = [
              cowsay
              python3
              poetry
            ];
            shellHook = ''
              cowsay "Successfully set up development environment!"
            '';
          };
        }
      );
}

