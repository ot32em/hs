module Main where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

numbers :: Int -> H.Html
numbers n = H.docTypeHtml

main :: IO ()
main = print $ numbers 10