-- q3

elementAt :: [a] -> Int -> a
elementAt (x:_) 1 = x
elementAt (x:xs) i
    | i < 1     = error "out of range"
    | otherwise = elementAt xs (i-1)
elementAt _ _ = error "out of range"


elementAt' :: [a] -> Int -> a
elementAt' xs i
    | length xs < i     = error "out of range"
    | otherwise         = fst . last $ zip xs [1..i]

