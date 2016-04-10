/* global exports */
"use strict";

// module Web3.Version

exports._getNode = function(web3) {
  return function(error) {
    return function(success) {
      return function() {
        web3.version.getNode(function(errVal, successVal) {
          if (errVal) {
            error(errVal)();
          } else {
            success(successVal)();
          }
        });
        return {};
      };
    };
  };
};
