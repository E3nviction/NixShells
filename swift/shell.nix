{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "swift-env";

  buildInputs = with pkgs; [
    swift
    swiftPackages.swiftpm
    python311Packages.swift
  ];

  shellHook = ''
    CC=clang
  '';
}
