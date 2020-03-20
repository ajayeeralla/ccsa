module Main where

import Prelude
import Types
import Data.List
import Data.Number.Nat
import Mylist



main :: IO ()
main = putStrLn "Hello, Haskell!"

-- this source code is from http://learnyouahaskell.com


removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = [x]

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = sideArea + 2 * topArea
    where sideArea = 2 * pi * r * h
          topArea = pi * r ^2

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]




