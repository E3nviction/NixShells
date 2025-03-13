{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    sdl3
  ];

  shellHook = ''
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
      pkgs.sdl3
    ]}:$LD_LIBRARY_PATH

    echo "Go SDL3 Development Environment (purego-sdl3)"
    echo "Go version: $(go version)"
    echo "LD_LIBRARY_PATH set to: $LD_LIBRARY_PATH"
    echo "Note: purego-sdl3 will dynamically load SDL3 libraries"
  '';
}
