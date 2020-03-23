module Main where
import Types
import Mylist
import Tree

exTree = Node (State "a" MTrue MFalse (Name 0))
            (Node (State "b" MTrue MFalse (Name 1)) EmptyT EmptyT)
            (Node (State "c" MTrue MFalse (Name 2)) EmptyT EmptyT)

main :: IO ()
main = do
    putStrLn "ccsaTrace on exTree is:"
    print (getTrace exTree)
