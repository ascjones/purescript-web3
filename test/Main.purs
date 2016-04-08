module Test.Main where

import Prelude (Unit, show, ($), (<$>), (>>=), bind)
import Control.Monad.Aff (liftEff')
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)

import Data.Either (Either(Right,Left))

import Test.Unit (failure, test, runTest, TIMER)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

import EthereumTestRpc (testRpcProvider)

import Web3 (Web3, createWeb3, version, ETHEREUM)

w3 :: forall eff. Eff (eth :: ETHEREUM | eff) Web3
w3 = do
  provider <- testRpcProvider
  createWeb3 provider

-- main :: forall e. Eff (eth :: ETHEREUM | e) Unit
main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT, eth :: ETHEREUM | eff) Unit
main = runTest do
  test "version" do
    v <- liftEff' $ w3 >>= version
    case _.api <$> v of
      Left err -> failure $ show err
      Right api -> Assert.equal api "0.3.0"
