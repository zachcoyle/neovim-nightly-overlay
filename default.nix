let
  sources = import ./nix/sources.nix;
  nixpkgs = sources."nixpkgs-unstable";
  pkgs = import nixpkgs {};
in
{
  neovim-nightly = pkgs.neovim-unwrapped.overrideAttrs (
    _: {
      version = "master";
      src = pkgs.fetchFromGitHub {
        inherit (sources.neovim) owner repo rev sha256;
      };
    }
  );
}