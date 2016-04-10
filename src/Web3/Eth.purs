module Web3.Eth where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error())
import Control.Monad.Aff (Aff, makeAff)

import Web3.Types (ETHEREUM, Web3, Address(..))

getAccounts :: forall e. Web3 -> Aff (eth :: ETHEREUM | e) (Array Address)
getAccounts web3 = makeAff (\error success -> _getAccounts web3 error (\addresses -> success $ Address <$> addresses))

foreign import _getAccounts :: forall e. Web3 -> (Error -> Eff e Unit) -> (Array String -> Eff e Unit) -> Eff e Unit
