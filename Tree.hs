module Tree where
import Types as T
import Control.Lens

data Tree a = EmptyT | Node a (Tree a) (Tree a) deriving (Show)

traversalBF :: Tree a -> [a]
traversalBF t = bft [t]
   where
       bft [] = []
       bft xs = map nodeValue xs ++ bft (concatMap leftAndRightNodes xs)
       nodeValue (Node a _ _) = a
       leftAndRightNodes (Node _ EmptyT EmptyT) = []
       leftAndRightNodes (Node _ EmptyT b)     = [b]
       leftAndRightNodes (Node _ a EmptyT)     = [a]
       leftAndRightNodes (Node _ a b)         = [a,b]

   -- |

createTree = Node 'A'
                  (Node 'B'
                      (Node 'C' EmptyT EmptyT)
                      (Node 'D' EmptyT EmptyT)
                  )
                  (Node 'E'
                      (Node 'F' EmptyT EmptyT)
                      (Node 'G' EmptyT (Node 'H'
                          (Node 'I' EmptyT EmptyT)
                          EmptyT
                      ))
                  )


type State = (Nat, T.Bool, T.Bool, Message, String)

newtype CCSATree = Tree State

getTerm :: CCSATree -> Message
getTerm EmptyT = EmptyMsg
getTerm Node x l r = x^._4

evalTree :: CCSATree -> Message
evalTree EmptyT = EmptyMsg
evalTree Node x l r = IfMThenElse x^._2 (getTerm l) (IfMThenElse x^._3 (getTerm r) EmptyMsg)


retTerms :: [T.Bool] -> [Message] -> Message
retTerms [] [] = EmptyMsg
retTerms [x] [y] = IfMThenElse x y EmptyMsg
retTerms (x:xs) (y:ys) = IfMThenElse x y (retTerms xs ys)


retrieveTerms :: [State] -> [Message]
retrieveTerms [ ] = [ ]
retrieveTerms (x:xs) =  map (\x -> retTerms (x ^. _2) (x ^. _3)) xs

--RetrieveTerms (x:xs) = [x]

-- creatTree1 :: CCSATree
-- creatTree1 = EmptyT
--Variable x : String





 --CCSATree :: Tree State

 --creatTree1 = Node`{a=(q_s, θ^1_1, t^1_1, θ^2_1, t^2_1)} EmptyT EmptyT
