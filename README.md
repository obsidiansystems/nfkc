# unicode-normal-forms for ghc and ghcjs

On GHC, this package uses [unicode-transforms](https://hackage.haskell.org/package/unicode-transforms) while on GHCJS it uses the browser's [native normalization](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize).

Currently supports NFKC normalization.
