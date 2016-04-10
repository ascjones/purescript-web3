module Web3.Providers where

import Control.Monad.Eff (Eff)

import Web3.Types

foreign import data Provider :: *

foreign import httpProvider :: forall eff. String -> Eff (eth :: ETHEREUM | eff) Provider
