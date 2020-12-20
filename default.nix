{ nixpkgsSrc ? <nixpkgs>, pkgs ? import nixpkgsSrc { }, compiler ? null }:

let
  haskellPackages = if compiler == null then
    pkgs.haskellPackages
  else
    pkgs.haskell.packages.${compiler};

in haskellPackages.developPackage {
  name = "language-c";
  root = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
  modifier = drv:
    with pkgs.haskell.lib;
    addBuildTools (dontCheck drv)
    (with pkgs; [ perl ruby haskellPackages.cabal-install ]);
  withHoogle = false; # TODO: Why doesn't this work
}
