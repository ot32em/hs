
type Answewr = [Int]


isQ :: Answer -> Bool
isQ [] = True
isQ xs = go x length xs
  where
    go (x : xs) n =
      if x == n then False
                else go xs n - 1
