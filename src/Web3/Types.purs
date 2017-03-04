module Web3.Types where

import Prelude

foreign import data ETHEREUM :: !

newtype Address = Address String
newtype Balance = Balance Number

derive newtype instance genericAddress :: Eq Address
