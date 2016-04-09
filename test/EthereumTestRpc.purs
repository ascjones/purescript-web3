module EthereumTestRpc where

import Control.Monad.Eff (Eff)

import Web3 (Provider, ETHEREUM)

foreign import provider :: forall eff. Eff (eth :: ETHEREUM | eff) Provider
