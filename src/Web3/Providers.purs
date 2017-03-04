module Web3.Providers where

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)

import Web3.Types (ETHEREUM)

type Payload =
  { jsonrpc :: String
  , id :: Int
  , method :: String
  , params :: Array String
  }

-- a should be of some type class that can be deserialised
type SendAsync eff a = Payload -> Aff (eth :: ETHEREUM, avar :: AVAR | eff) a
