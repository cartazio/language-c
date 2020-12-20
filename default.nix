{ nixpkgsSrc ? <nixpkgs>, pkgs ? import nixpkgsSrc { }, compiler ? null }:

let
  haskellPackages = if compiler == null then
    pkgs.haskellPackages
  else
    pkgs.haskell.packages.${compiler};

in haskellPackages.developPackage {
  name = "language-c";
  root = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
}
