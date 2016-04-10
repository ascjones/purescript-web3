module EthereumTestRpc where

import Control.Monad.Eff (Eff)

import Web3.Types (ETHEREUM)
import Web3.Providers (Provider)

foreign import provider :: forall eff. Eff (eth :: ETHEREUM | eff) Provider
