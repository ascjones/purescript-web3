module EthereumTestRpc where

import Control.Monad.Eff (Eff)

import Web3.Types (ETHEREUM)
import Web3.Providers (Provider)

foreign import _sendAsync :: forall e. Eff (eth :: ETHEREUM | eff) Provider
