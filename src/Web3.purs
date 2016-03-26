module Web3 where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

type Version =
  { api       :: String
  , node      :: String
  , network   :: String
  , ethereum  :: String
  , whisper   :: String
  }

data Address = Address String

type Eth =
  { defaultAccount :: Address }

foreign import data Web3 :: *
foreign import data Provider :: *

foreign import data ETHEREUM :: !

foreign import version :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Version
foreign import isConnected :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Boolean
foreign import setProvider :: forall eff. Web3 -> Provider -> Eff (eth :: ETHEREUM | eff) Unit
