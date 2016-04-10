module Web3 where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

import Web3.Providers (Provider)
import Web3.Types (ETHEREUM, Web3)

foreign import createWeb3 :: forall eff. Unit -> Eff (eth :: ETHEREUM | eff) Web3
foreign import isConnected :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Boolean

foreign import setProvider :: forall eff. Provider -> Web3 -> Eff (eth :: ETHEREUM | eff) Unit
