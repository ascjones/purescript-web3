/* global exports */
"use strict";

// module EthereumTestRpc

exports.testRpcProvider = function() {
  return function() {
    require('ethereumjs-testrpc').provider();
  }
}
