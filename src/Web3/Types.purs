module Web3.Types where

import Data.Generic (class Generic, gEq)

data ETHEREUM :: !

newtype Address = Address String

derive instance genericAddress :: Generic Address
instance eqAddress :: Eq Address where eq = gEq
