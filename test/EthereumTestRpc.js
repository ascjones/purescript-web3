/* global exports */
"use strict";

// module EthereumTestRpc

const provider = require('ethereumjs-testrpc').provider();

exports.sendAsync = function(payload) {
  return function (callback) {
    provider.sendAsync(payload, callback);
  };
}
