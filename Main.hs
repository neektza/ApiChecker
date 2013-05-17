{-# LANGUAGE OverloadedStrings, ViewPatterns, BangPatterns #-}

module Main where

import CheckerTypes

import Control.Applicative ((<$>), (<*>))
import Control.Monad  
import Data.Char  

import Network.HTTP
import Data.Aeson ((.:), (.:?), decode, FromJSON(..), Value(..))

-- instance FromJSON Event where
-- 	parseJSON (Object o) = Paste <$> 

instance FromJSON Event where
  parseJSON (Object v) =
    Event <$>
    (v .: "id")				<*>
    (v .: "title")			<*>
    (v .:? "body")			<*>
    (v .: "origin_ts")		<*>
    (v .: "origin_date")


instance FromJSON User where
  parseJSON (Object v) =
    Event <$>
    (v .: "name")			<*>
    (v .:? "email")			<*>
    (v .:? "avatar_url")

makeMeAnEvent :: (String s) => s -> Event
makeMeAnEvent = decode :: Maybe Event

-- main = forever $ do
	-- url <- getLine
	-- putStrLn $ "Checking : " ++ url

main = do
	rsp <- Network.HTTP.simpleHTTP (getRequest "http://bithub.com/api/events")
	putStrLn "Response : " >> makeMeAnEvent $ getResponseBody rsp
