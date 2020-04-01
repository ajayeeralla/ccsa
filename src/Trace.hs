module Trace where
  import qualified Data.LTS as L
  import Types
  import Data.Nat

  -- | Get folded term from a transition
  getTerm :: L.Transition Message MBool -> Message
  getTerm L.Transition {L.from=x, L.guard=c, L.to=y} = IfMThenElse c (L.output y) EmptyMsg

  -- | Get folded term for whole LTS
  getLTSTerm :: L.LTS Message MBool -> Nat -> Message
  getLTSTerm [] _ = EmptyMsg
  getLTSTerm (t:ts) 0 = L.output (L.from t)
  getLTSTerm (t:ts) (S n) =IfMThenElse (L.guard t) (getLTSTerm (L.collectTrans (L.to t) ts) n) (getLTSTerm ts (S n))

  -- | Folded symbolic execution of the LTS has the following trace
  traceLTS :: L.LTS Message MBool -> [Message]
  traceLTS lts = [getLTSTerm lts i | i <- [1..dep]]
    where
      dep =L.depth lts start
      start= L.getStartSt lts
