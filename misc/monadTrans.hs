
askUserName :: IO (Maybe String)
askUserName = do
    print "User name: "
    s <- getLine
    if length s >= 5 then return $ Just s
                     else return $ Nothing

askEmail :: IO (Maybe String)
askEmail = do
    print "Email: "
    e <- getLine
    if elem '@' e then return $ Just e
                  else return Nothing

askPhone :: IO (Maybe String)
askPhone = do
    print "Phone: "
    p <- getLine
    if all isDigit p then return $ Just p
                     else return Nothing
    where
        isDigit :: Char -> Bool
        isDigit x = any (\d -> x == d) ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

main :: IO()
main = do
    n <- askUserName
    case n of         
        Nothing   -> print "Invalid username"
        Just name -> do
            e <- askEmail
            case e of
                Nothing -> print "Invalid email"
                Just email -> do
                    p <- askPhone
                    case p of
                        Nothing -> print "Invalid phone"
                        Just phone -> print $ name ++ " " ++ email ++ " " ++ phone ++ " Ok"