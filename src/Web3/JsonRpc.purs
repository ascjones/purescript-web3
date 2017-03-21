module Web3.JsonRpc
  ( JsonRpcRequest
  , JsonRpcResponse
  ) where

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Data.Argonaut.Core (Json, jsonEmptyObject)
import Data.Argonaut.Encode (class EncodeJson, encodeJson, (:=), (~>))
import Data.Either (Either)
import Data.Maybe (Maybe)

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

newtype JsonRpcResponse a =
  JsonRpcResponse (Either JsonRpcFailure (JsonRpcSuccess a))

-- instance decodeJsonRpcResponse :: DecodeJson JsonRpcResponse where
--   decodeJson = gDecodeJson

data JsonRpcSuccess a =
  JsonRpcSuccess
  { jsonrpc :: String
  , id :: Int
  , result :: a
  }

data JsonRpcFailure =
  JsonRpcFailure
  { jsonrpc :: String
  , id :: Maybe Int
  , error :: String
  }

type SendJsonRpcRequest e = Json -> Aff (avar :: AVAR | e) Json

-- sendRequest
--   :: forall e a b
--    . (SendJsonRpcRequest e)
--   -> (JsonRpcRequest a)
--   -> Aff (avar :: AVAR | e) (JsonRpcResponse b)
-- sendRequest send req = do
--   responseJson <- send reqJson
--   let response = decodeJson responseJson
--   pure response
--
--   where
--
--   reqJson = encodeJson req

encode :: forall a. EncodeJson a => JsonRpcRequest a -> Json
encode = encodeJson
