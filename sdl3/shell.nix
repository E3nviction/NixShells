{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Define the build inputs (dependencies)
  buildInputs = with pkgs; [
    go
    sdl3
  ];

  shellHook = ''
    # Ensure GOPATH is set up
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    # Set LD_LIBRARY_PATH to include SDL3 library paths
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
      pkgs.sdl3
    ]}:$LD_LIBRARY_PATH

    # Print a welcome message and diagnostics
    echo "Go SDL3 Development Environment (purego-sdl3)"
    echo "Go version: $(go version)"
    echo "LD_LIBRARY_PATH set to: $LD_LIBRARY_PATH"
    echo "Note: purego-sdl3 will dynamically load SDL3 libraries"
  '';
}
