module EthereumTestRpc where

import Control.Monad.Aff (makeAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Argonaut.Core (Json)
import Data.Function.Uncurried (Fn4, runFn4)
import Prelude (Unit)
import Web3.JsonRpc (SendJsonRpcRequest)
import Web3.Types (ETHEREUM, Address, Balance)

foreign import data TestRpcProvider :: *

foreign import data TESTRPC :: !

type InitialAccount =
  { address :: Address
  , balance :: Balance }

type Options =
  { accounts :: Array InitialAccount }

-- type SendJsonRpcRequest e = Json -> Aff (avar :: AVAR | e) Json

sendAsync :: forall e. TestRpcProvider -> SendJsonRpcRequest (eth :: ETHEREUM | e)
sendAsync provider json = makeAff (\error success -> runFn4 sendAsyncImpl provider json success error)

foreign import testRpcProvider
  :: forall e
   . Options -> Eff (rpc :: TESTRPC | e) TestRpcProvider

foreign import sendAsyncImpl
  :: forall e
   . Fn4 TestRpcProvider
         Json
         (Json -> Eff (eth :: ETHEREUM | e) Unit)
         (Error -> Eff (eth :: ETHEREUM | e) Unit)
         (Eff (eth :: ETHEREUM | e) Unit)
