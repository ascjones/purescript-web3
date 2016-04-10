module Test.Main where

import Prelude (Unit, unit, show, (==), ($), (>>=), bind, return)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)

import Data.Either (Either(Right,Left))

import Test.Unit (failure, test, runTest, TIMER)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

-- import EthereumTestRpc (provider)

import Web3 (Web3, createWeb3, httpProvider, setProvider, isConnected, ETHEREUM)
import Web3.Version (getNodeVersion)

-- connection to devnet geth node
web3DevNet :: forall eff. Eff (eth :: ETHEREUM | eff) Web3
web3DevNet = do
  w3 <- createWeb3 unit
  provider <- httpProvider "http://localhost:8545" -- expects local node running
  setProvider provider w3
  return w3

main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT, eth :: ETHEREUM | eff) Unit
main = runTest do
  test "isConnected" do
    connected <- liftEff $ web3DevNet >>= isConnected
    let success = connected == true
    Assert.equal true true
  test "version" do
    web3 <- liftEff $ web3DevNet
    nodeVersion <- getNodeVersion $ web3
    Assert.equal "Geth/v1.3.6/linux/go1.5.1" nodeVersion
        -- Assert.equal "0.15.3" v.api
        -- Assert.equal "0.15.3" v.node
        -- Assert.equal "0.15.3" v.network
        -- Assert.equal "0.15.3" v.ethereum
        -- Assert.equal "0.15.3" v.whisper
