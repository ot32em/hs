-- https://hackage.haskell.org/package/digestive-functors
-- https://github.com/jaspervdj/digestive-functors/blob/master/examples/tutorial.lhs
-- https://github.com/jaspervdj/digestive-functors

module Main where


data User = User {
  name  :: String,
  email :: String, -- [\w\d]+@([\d\w]+.)+[\w\d]+
  phone :: String -- [+886|0]912-345678
} deriving (Show)

userOk :: User
userOk = User "OT Chen" "ot32em@gmail.com" "0928123456"

userNg :: User
userNg = User "" "ot32em%gmail.com" "0928z"

validateUser :: User -> IO ()
validateUser user = do
  print $ "Name: " ++ name user
  print $ "email: " ++ email user
  print $ "phone number: " ++ phone user


main :: IO ()
main = validateUser userOk