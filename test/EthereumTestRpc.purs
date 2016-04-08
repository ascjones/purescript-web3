module EthereumTestRpc where

import Control.Monad.Eff (Eff)

import Web3 (Provider, ETHEREUM)

foreign import testRpcProvider :: forall eff. Eff (eth :: ETHEREUM | eff) Provider
