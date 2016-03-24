/* global exports */
"use strict";

// module Web3

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
