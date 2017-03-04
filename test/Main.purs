module Test.Main where

import Prelude (Unit, unit, show, (==), ($), (>>=), bind)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)

import Data.Either (Either(Right,Left))

import Test.Unit (failure, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

import Web3.Types (ETHEREUM, Address(..))
import Web3.Eth (getAccounts)
import Web3.Providers (SendAsync)
import EthereumTestRPC (testRPCProvider, TESTRPC, Options, InitialAccount)

main :: forall eff. Eff (avar :: AVAR, testOutput :: TESTOUTPUT, rpc :: TESTRPC, eth :: ETHEREUM | eff) Unit
main = runTest do
  test "getAccounts" do
    -- let options =
    --   { accounts : [ { address : Address "address", balance : Balance 1.0 } ] }
    provider <- testRPCProvider { accounts : [] }
    accounts <- getAccounts $ web3
    Assert.equal [] accounts
