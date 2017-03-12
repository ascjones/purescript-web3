module Test.Main where

import Test.Unit.Assert as Assert
import Control.Monad.Aff (liftEff')
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Data.Either (Either(Right, Left))
import EthereumTestRPC (InitialAccount, Options, TESTRPC, sendAsync, testRPCProvider)
import Prelude (Unit, bind, pure, show, unit, ($), (==), (>>=))
import Test.Unit (failure, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Web3.Eth (getAccounts)
import Web3.Providers (SendAsync)
import Web3.Types (ETHEREUM, Address(..))

main :: forall eff. Eff (avar :: AVAR, testOutput :: TESTOUTPUT, rpc :: TESTRPC, eth :: ETHEREUM | eff) Unit
main = runTest do
  test "getAccounts" do
    -- let options =
    --   { accounts : [ { address : Address "address", balance : Balance 1.0 } ] }
    provider <- liftEff' $ testRPCProvider { accounts : [] }
    case provider of
      Left err -> pure unit
      Right p -> do
        send <- sendAsync p
        accounts <- getAccounts send
        Assert.equal "" accounts
