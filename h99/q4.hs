expectedMethod = reverse

assertR :: Eq a => [a] -> ([a] -> [a]) -> String -> IO ()
assertR fixture testMethod name 
    | expectedMethod(fixture) == testMethod(fixture) = print $ name ++ " passed"
    | otherwise                                      = print $ name ++ " failed"
    

    
r1 :: [a] -> [a]
r1 = reverse

r2 xs = foldl (\z a -> a : z) [] xs

r3 (x:xs) = (r3 xs) ++ [x]
r3 [] = []


assertR' = assertR [1..5]

testQ4 :: IO ()
testQ4 = do
    assertR' r1 "reverse1"
    assertR' r2 "reverse2"
    assertR' r3 "reverse3"
    --assertR' r4 "reverse4"

main = testQ4