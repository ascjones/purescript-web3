module EthereumTestRPC where

import Control.Monad.Aff (makeAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Function.Uncurried (Fn4, runFn4)
import Prelude (Unit)
import Web3.Providers (SendAsync, Payload)
import Web3.Types (ETHEREUM, Address, Balance)

foreign import data TestRPCProvider :: *

foreign import data TESTRPC :: !

type InitialAccount =
  { address :: Address
  , balance :: Balance }

type Options =
  { accounts :: Array InitialAccount }

sendAsync :: forall eff. TestRPCProvider -> SendAsync eff String
sendAsync provider payload =
  makeAff (\error success -> runFn4 sendAsyncImpl provider payload success error)

foreign import testRPCProvider
  :: forall eff
   . Options -> Eff (rpc :: TESTRPC | eff) TestRPCProvider

foreign import sendAsyncImpl
  :: forall eff
   . Fn4 TestRPCProvider
         Payload
         (String -> Eff (eth :: ETHEREUM | eff) Unit)
         (Error -> Eff (eth :: ETHEREUM | eff) Unit)
         (Eff (eth :: ETHEREUM | eff) Unit)
