module Web3 where

import Control.Monad.Eff (Eff)

type Version =
  { api       :: String
  , node      :: String
  , network   :: String
  , ethereum  :: String
  , whisper   :: String
  }

foreign import data Web3 :: *

foreign import data ETHEREUM :: !

foreign import version :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Version
foreign import isConnected :: forall eff. Web3 -> Eff (eth :: ETHEREUM | eff) Boolean
