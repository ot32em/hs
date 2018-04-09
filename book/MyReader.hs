module ReaderExample where


newtype Reader r a = ReaderC { runReader :: r -> a }


instance Functor (Reader r)  where
--    fmap :: (a -> b) -> Reader r a -> Reader r b
    fmap f t = ReaderC $ \x -> f $ runReader t x

instance Applicative (Reader r) where
    pure = ReaderC . const
    tf <*> ta = ReaderC $ \r -> runReader (fmap (runReader tf r) ta) r

instance Monad (Reader r) where
    return = pure
    -- >>= :: (a -> Reader r b) -> Reader r a -> Reader r b
    ta >>= f = ReaderC $ \r ->
                 runReader (f $ runReader ta r) r

ask :: Reader a a
ask = ReaderC id

local :: (r -> r) -> (Reader r a) -> Reader r a
local f g = ReaderC $ (runReader g) . f


data Greeting = Greeting {
    name   :: String,
    header :: String,
    body   :: String,
    footer :: String
}

instance Show Greeting where
  show (Greeting n h b f) =
    foldl (\z -> \a -> z ++ "\n" ++ a) "" [n, h, b, f]


headerT :: Reader String String
headerT = ReaderC $ (++) "Welcome to my site "

bodyT :: Reader String String
bodyT = ReaderC $ (++) "This is site is built for you, "

footerT :: Reader String String
footerT = ReaderC $ (++) "See you next time "


renderGreeting :: Reader String Greeting
renderGreeting = do
    n <- ask
    h <- headerT
    (b, f) <- local ("Mr. and Ms. " ++) $ do
        b' <- bodyT
        f' <- footerT
        return (b', f')
    return $ Greeting n h b f


testGreeting :: IO ()
testGreeting =
  print "{"
  print $ runReader renderGreeting "OT"
  print "}"
