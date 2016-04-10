/* global exports */
"use strict";

// module Web3.Providers

const Web3 = require('web3');

exports.httpProvider = function(url) {
  return function() {
    var web
    return new Web3.providers.HttpProvider(url);
  };
};
