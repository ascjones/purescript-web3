/* global exports */
"use strict";

// module Web3.Eth

exports._getAccounts = function(web3) {
  return function(error) {
    return function(success) {
      return function() {
        web3.eth.getAccounts(function(errVal, successVal) {
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

// exports._getBalance = function(web3) {
//   return function(address) {
//     return function(error) {
//       return function(success) {
//         return function
//       };
//     };
//   };
// };
