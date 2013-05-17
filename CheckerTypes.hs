module CheckerTypes (
Event(..),
User(..),
validEvent,
validUser
) where

-- import Data.DateTime
-- import Data.Date

data Event = Event {
	id           :: Int
	, title      :: String
	, body       :: Maybe String
	, originTS   :: String
	, originDate :: String
} deriving (Show)

validEvent :: Event -> Bool
validEvent e = True

data User = User {
	name         :: String
	, email      :: Maybe String
	, avatarURL  :: Maybe String
} deriving (Show)

validUser :: User -> Bool
validUser u = True
