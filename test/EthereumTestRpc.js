/* global exports */
"use strict";

// module EthereumTestRpc

exports.provider = function() {
  var TestRPC = require('ethereumjs-testrpc');
  return TestRPC.provider();
}
