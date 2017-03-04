module EthereumTestRpc where

import Control.Monad.Eff (Eff)

import Web3.Types (ETHEREUM)
import Web3.Providers (Provider)

sendAsync :: forall e. SendAsync e
sendAsync

foreign import _sendAsync :: forall e. Eff (eth :: ETHEREUM | eff) Provider
