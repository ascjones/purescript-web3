module Web3.JsonRpc
  ( JsonRpcRequest
  , JsonRpcResponse
  ) where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Data.Argonaut.Core (Json, jsonEmptyObject)
import Data.Argonaut.Decode (class DecodeJson, decodeJson, (.?))
import Data.Argonaut.Encode (class EncodeJson, encodeJson, (:=), (~>))
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))

-- todo: see whether we can use generic deriving for encode/decode

--
-- Request
--
newtype JsonRpcRequest a =
  JsonRpcRequest
  { jsonrpc :: String
  , id :: Int
  , method :: String
  , params :: Maybe a
  }

instance encodeJsonRpcRequesqt :: EncodeJson a => EncodeJson (JsonRpcRequest a) where
  encodeJson (JsonRpcRequest req)
     = "jsonrpc" := req.jsonrpc
    ~> "id" := req.id
    ~> "method" := req.method
    ~> "params" := req.params
    ~> jsonEmptyObject

--
-- Response
--
newtype JsonRpcResponse a =
  JsonRpcResponse (Either JsonRpcFailure (JsonRpcSuccess a))

newtype JsonRpcSuccess a =
  JsonRpcSuccess
  { jsonrpc :: String
  , id :: Int
  , result :: a
  }

newtype JsonRpcFailure =
  JsonRpcFailure
  { jsonrpc :: String
  , id :: Maybe Int
  , error :: String
  }

instance decodeJsonRpcResponse :: DecodeJson a => DecodeJson (JsonRpcResponse a) where
  decodeJson json = do
    pure $ JsonRpcResponse $ Left $ JsonRpcFailure { jsonrpc : "jsonrpc", id : Nothing, error : "error" }

instance decodeJsonRpcFailure :: DecodeJson a => DecodeJson JsonRpcFailure where
  decodeJson json = do
    obj <- decodeJson json
    jsonrpc <- obj .? "jsonrpc"
    id <- obj .? "id"
    error <- obj .? "error"
    pure $ JsonRpcFailure { jsonrpc, id, error }

instance decodeJsonRpcSuccess :: DecodeJson a => DecodeJson (JsonRpcSuccess a) where
  decodeJson json = do
    obj <- decodeJson json
    jsonrpc <- obj .? "jsonrpc"
    id <- obj .? "id"
    result <- obj .? "result"
    pure $ JsonRpcSuccess { jsonrpc, id, result }

type SendJsonRpcRequest e = Json -> Aff (avar :: AVAR | e) Json

sendRequest
  :: forall e a b
   . (EncodeJson a, DecodeJson b)
  => (SendJsonRpcRequest e)
  -> (JsonRpcRequest a)
  -> Aff (avar :: AVAR | e) (JsonRpcResponse b)
sendRequest send req = do
  responseJson <- send $ encodeJson req
  let response = decodeJson responseJson
  case response of
    Left _ -> pure $ JsonRpcResponse $ Left $ JsonRpcFailure { jsonrpc : "jsonrpc", id : Nothing, error : "error" }
    Right res -> pure res
