module Web3.Types where

import Data.Generic (class Generic, gEq)

foreign import data ETHEREUM :: !
foreign import data Web3 :: *

newtype Address = Address String

derive instance genericAddress :: Generic Address
instance eqAddress :: Eq Address where eq = gEq
