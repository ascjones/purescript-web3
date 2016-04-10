module Web3 where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

data Address = Address String

type Eth =
  { defaultAccount :: Address }

foreign import data Web3 :: *
foreign import data Provider :: *

foreign import data ETHEREUM :: !

foreign import createWeb3 :: forall eff. Unit -> Eff (eth :: ETHEREUM | eff) Web3
foreign import isConnected :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Boolean

foreign import httpProvider :: forall eff. String -> Eff (eth :: ETHEREUM | eff) Provider
foreign import setProvider :: forall eff. Provider -> Web3 -> Eff (eth :: ETHEREUM | eff) Unit
