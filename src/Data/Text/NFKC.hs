{-# Language CPP #-}
#ifndef ghcjs_HOST_OS
{-# Language JavaScriptFFI #-}
#endif

module Data.Text.NFKC where

#ifndef ghcjs_HOST_OS
import Data.Text.Normalize
-- GHCJS uses this instead:
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize
#endif
import Data.Text (Text)

#ifdef ghcjs_HOST_OS
foreign import javascript safe
  "(function() { return ($1['normalize']('NFKC')); })()"
  normalizeNFKC :: Text -> Text
#else
-- | Transform text into NKFC normal form
normalizeNFKC :: Text -> Text
normalizeNFKC = normalize NFKC
#endif
