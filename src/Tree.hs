module Tree
(Tree(..)
, retDepth
, State(..)
, getTerm
, evalTree
, getLevelTerm
, getTrace
) where
import Types
import Data.Nat

data Tree a = EmptyT | Node a (Tree a) (Tree a) deriving (Read, Show, Eq)

-- | return depth of a tree

retDepth :: Tree a -> Nat
retDepth EmptyT = Z
retDepth (Node x l r) = S (max (retDepth l) (retDepth r))

-- | a record type to model node info

data State = State {name ::String
                    , chk1 :: MBool
                    , chk2 :: MBool
                    , out :: Message
                    }

type CCSATree = Tree State

-- | get output term from the current node

getTerm :: CCSATree -> Message
getTerm EmptyT = EmptyMsg
getTerm (Node x l r) = out x

-- | get current node value

getName :: CCSATree -> String
getName EmptyT = ""
getName (Node x l r) = name x

-- | get current node state
getState :: CCSATree -> State
getState EmptyT = State "" MTrue MTrue EmptyMsg
getState (Node x _ _) = x

-- | check if the current node is leaf

isLeaf :: CCSATree -> Bool
isLeaf EmptyT = True
isLeaf Node {} = False

-- | get the folded term one-level down from the current node

evalTree :: CCSATree -> Message
evalTree EmptyT = EmptyMsg
evalTree (Node x l r) = IfMThenElse (chk1 x) (getTerm l) (IfMThenElse (chk2 x) (getTerm r) EmptyMsg)


-- | get level folding term for the given level

getLevelTerm :: CCSATree -> Nat -> Message
getLevelTerm  EmptyT _ = EmptyMsg
getLevelTerm  (Node x _ _) Z = out x
getLevelTerm  (Node x l r) (S n) = IfMThenElse (chk1 x) (getLevelTerm l n) (IfMThenElse (chk2 x) (getLevelTerm r n) EmptyMsg)

-- | get trace ---folding terms for all levels.

getTrace :: CCSATree -> [Message]
getTrace EmptyT = [EmptyMsg]
getTrace xs = [getLevelTerm xs n  | n <- [1..depth] ]
    where depth = retDepth xs
