module Web3.Version where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error())
import Control.Monad.Aff (Aff, makeAff)

import Web3.Types (Web3)

getNodeVersion :: forall e. Web3 -> Aff e String
getNodeVersion web3 = makeAff (_getNodeVersion web3)

foreign import _getNodeVersion :: forall e. Web3 -> (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff e Unit
