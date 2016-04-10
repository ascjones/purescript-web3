module Web3.Types where

foreign import data ETHEREUM :: !
foreign import data Web3 :: *

newtype Address = Address String
