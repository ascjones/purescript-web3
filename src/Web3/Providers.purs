module Web3.Providers where

import Control.Monad.Aff (Aff, AVAR)
import Control.Monad.Eff (Eff)

import Web3.Types (ETHEREUM)

type Payload =
  { jsonrpc : String
  , id : Int
  , method : String
  , params : Array String
  }

-- a should be of some type class that can be deserialised
type SendAsync eff a = Payload -> Aff (eth :: ETHEREUM, avar :: AVAR | eff) a
-- type QC eff a = Eff (console :: CONSOLE, random :: RANDOM, err :: EXCEPTION | eff) a

-- foreign import httpProvider :: forall eff. String -> Eff (eth :: ETHEREUM | eff) Provider
