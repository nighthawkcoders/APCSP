{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  inherit (pkgs) bundlerEnv stdenv;
  pythonDeps = ps: with ps; [
    jupyter
    bash_kernel
  ];
  pythonEnv = python3.withPackages pythonDeps;
in mkShell {
  buildInputs = [
    pythonEnv
    nodejs
    nodePackages.npm
    nodePackages.ijavascript
  ];
}