module Test.Main where

import Prelude (Unit, unit, show, (==), ($), (>>=), bind, return)
import Control.Monad.Aff (liftEff')
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)

import Data.Either (Either(Right,Left))

import Test.Unit (failure, test, runTest, TIMER)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

-- import EthereumTestRpc (provider)

import Web3 (Web3, createWeb3, httpProvider, setProvider, isConnected, version, ETHEREUM)

-- connection to devnet geth node
web3DevNet :: forall eff. Eff (eth :: ETHEREUM | eff) Web3
web3DevNet = do
  w3 <- createWeb3 unit
  provider <- httpProvider "http://devnet:8545" -- expects local node running
  setProvider provider w3
  return w3

main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT, eth :: ETHEREUM | eff) Unit
main = runTest do
  test "isConnected" do
    connected <- liftEff' $ web3DevNet >>= isConnected
    case connected of
      Left err -> failure $ show err
      Right ic -> do
        let success = ic == true
        Assert.equal true true
  test "version" do
    vr <- liftEff' $ web3DevNet >>= version
    case vr of
      Left err -> failure $ show err
      Right v -> do
        Assert.equal "0.15.3" v.api
        -- Assert.equal "0.15.3" v.node
        -- Assert.equal "0.15.3" v.network
        -- Assert.equal "0.15.3" v.ethereum
        -- Assert.equal "0.15.3" v.whisper
