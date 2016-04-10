module Web3.Version where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error())
import Control.Monad.Aff (Aff, makeAff)

import Web3 (Web3)

-- import Web3.Async (Callback, JSCallback, handleCallback)

-- foreign import data Version :: *

getNode :: forall e. Web3 -> Aff e String
getNode v = makeAff (_getNode v)

foreign import _getNode :: forall e a. Web3 -> (Error -> Eff e Unit) -> (a -> Eff e Unit) -> Eff e Unit
