module Answer01 where

myLast :: [a] -> a
myLast [] = error "empty list"
myLast (x:[]) = x
myLast (x:xs) = myLast xs

-- const :: a -> b -> a
-- const a _ = a
-- id :: a -> a
-- id a = a
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- const id = \x -> id
-- const id = \x -> \y -> y
-- const id _ = id
myLast' :: [a] -> a
myLast' = foldr1 (const id)

-- flip :: (a -> b -> c) -> (b -> a -> c)
-- flip (a -> b -> c) = 
-- myLast'' = foldr1 (flip const)