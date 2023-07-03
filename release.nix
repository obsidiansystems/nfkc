{}:
let
  pkgs = (import ./reflex-platform {}).nixpkgs;
  supportedSystems = [ "x86_64-linux" ];
  inherit (pkgs) lib;
  haskellLib = pkgs.haskell.lib;
  ghcs = lib.genAttrs supportedSystems (system: let
    p = import ./reflex-platform { inherit system; };
  in
  {
    recurseForDerivations = true;
    ghc8107 = p.ghc8_10.callCabal2nix "unicode-normal-forms" (import ./src.nix) {};
    ghcjs810 = p.ghcjs8_10.callCabal2nix "unicode-normal-forms" (import ./src.nix) {};
  });
  in
    ghcs
