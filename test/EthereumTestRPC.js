/* global exports */
"use strict";

// module EthereumTestRPC

exports.testRPCProvider = function(options) {
  return function() {
    require('ethereumjs-testrpc').provider(options);
  }
}

exports.sendAsyncImpl = function(provider, payload, done, fail) {
  return function () {
    provider.sendAsync(payload, function(err, result) {
      if (err) {
        fail(err)();
      } else {
        done(result);
      }
    });
  };
};
