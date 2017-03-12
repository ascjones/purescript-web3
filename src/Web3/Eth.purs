module Web3.Eth where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Web3.Types (ETHEREUM, Address)

type Method a b = forall e. a -> Aff (eth :: ETHEREUM, avar :: AVAR | e) b

-- type Methods =
--   { getAccounts : Method Unit (Array Address) }

-- getAccounts
--   :: forall e
--    . (SendAsync e (Array Address))
--   -> Aff (eth :: ETHEREUM, avar :: AVAR | e) (Array Address)
-- getAccounts sendAsync =
--   sendAsync "eth_" unit
