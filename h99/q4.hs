module Main where


-- 4. find the number of elements of a list
myLength :: [a] -> Int
myLength = myLength32


-- recur add
myLength1 [] = 0
myLength1 (x:xs) = 1 + myLength xs


-- foldr/foldl
myLength21 xs = foldl (const . (+1)) 0 xs
myLength22 xs = foldr (\a z -> z + 1) 0 xs
myLength23 xs = foldr (const (+1)) 0 xs


-- sum
newtype Sum = Sum Int

getSum :: Sum -> Int
getSum (Sum x) = x

instance Monoid Sum where
    mempty = Sum 0
    mappend (Sum x) (Sum y) = Sum $ x + y 

myLength31 xs = getSum $ foldl mappend mempty (fmap (const (Sum 1)) xs)
myLength32 xs = sum $ fmap (const 1) xs

-- zip
myLength5 :: [a] -> Int
myLength5 = fst . last . zip [1..]
    

src1 = [3, 1, 4, 5]
src2 = ([1..], 0)

main :: IO ()
main = do
  print $ myLength src1
  print $ myLength []
  print $ myLength [1..100]
