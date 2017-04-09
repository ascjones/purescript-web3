module Web3.Eth where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Data.Maybe (Maybe(..))
import Web3.JsonRpc (JSONRPC, JsonRpcRequest(..), SendJsonRpcRequest, sendRequest)
import Web3.Types (ETHEREUM, Address)

type Method a b = forall e. a -> Aff (eth :: ETHEREUM, avar :: AVAR | e) b

getAccounts
  :: forall e
   . SendJsonRpcRequest e
  -> Unit
  -> Aff (rpc :: JSONRPC, avar :: AVAR | e) (Array Address)
getAccounts send _ = sendRequest send request
  where
  request :: JsonRpcRequest Unit
  request = JsonRpcRequest $
    { jsonrpc : "jsonrpc"
    , id : 0
    , method : "eth_accounts"
    , params : Nothing
    }
