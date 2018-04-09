module MyForm where


data User = User {
  name  :: String,
  email :: String, -- [\w\d]+@([\d\w]+.)+[\w\d]+
  phone :: String -- [+886|0]912-345678
} deriving (Show)


enterForm :: IO ()
enterForm = do
  print "Name:"
  n <- getLine
  print "email: "
  m <- getLine
  print "phone number: "
  p <- getLine
  print $ User n m p
