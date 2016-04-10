module Web3.BigNumber where

import Prelude

foreign import data BigNumber :: *

foreign import toString :: BigNumber -> String
foreign import toNumber :: BigNumber -> Number
