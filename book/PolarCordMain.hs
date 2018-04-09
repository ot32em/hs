module Main where

import Test


a = Cart 0 0
b = Polar 5 (3.14/4)

c = Polar 4 0

main :: IO ()
main = do
    print( dis a b )
    print("Hello")
