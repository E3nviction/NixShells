# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
  buildInputs = [
    pkgs.python312Packages.pip
    pkgs.python312Packages.psutil
    pkgs.python312Packages.pygobject3
    pkgs.gtk4
    pkgs.gtk3
    pkgs.librsvg
    pkgs.libdbusmenu-gtk3
    pkgs.gdk-pixbuf
    pkgs.cinnamon-desktop
    pkgs.pulseaudio
    pkgs.gtk-layer-shell
    pkgs.gobject-introspection
    pkgs.gnome-bluetooth
  ];

  shellHook = ''
    export PYTHONPATH="${pkgs.python312Packages.pygobject3}/lib/python3.12/site-packages"
  '';
}
