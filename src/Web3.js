/* global exports */
"use strict";

// module Web3

const Web3 = require('web3');

exports.createWeb3 = function() {
  return function() {
    return new Web3();
  };
};

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

exports.httpProvider = function(url) {
  return function() {
    return new Web3.providers.HttpProvider(url);
  };
};

exports.setProvider = function(provider) {
  return function(web3) {
    return function() {
      web3.setProvider(provider);
    };
  };
};

exports.currentProvider = function(web3) {
  return function() {
    return web3.currentProvider;
  };
};
