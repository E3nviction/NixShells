with import <nixpkgs> {};
pkgs.mkShell.override {
  inherit (pkgs.swift) stdenv;
} {
  buildInputs = [
    swift
    swiftpm
    glibc
  ];
  LD_LIBRARY_PATH = "${swiftPackages.Dispatch}/lib";
}
