module Web3.Types where

import Prelude

foreign import data ETHEREUM :: !

newtype Address = Address String

derive newtype instance genericAddress :: Eq Address
