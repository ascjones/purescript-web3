/* global exports */
"use strict";

// module Web3

exports.createWeb3 = function() {
  return function() {
    var Web3 = require('web3');
    return new Web3();
  }
}

exports.version = function(web3) {
  return function() {
    return web3.version;
  };
};

exports.isConnected = function(web3) {
  return function() {
    return web3.isConnected;
  };
};

exports.setProvider = function(web3) {
  return function(provider) {
    return funtion() {
      return web3.setProvider(provider);
    }
  };
};

exports.currentProvider = function(web3) {
  return funtion() {
    return web3.currentProvider;
  }
};
