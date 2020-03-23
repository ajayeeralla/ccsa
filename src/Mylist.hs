module Mylist
  (Mylist,
  lenMl,
  isMsg,
  isBool) where
import Data.List.Indexed.Counted
import Types


type Mylist n = CountedList n Oursum

lenMl = count

-- | Check if the given Oursum term indeed a Message
isMsg :: Oursum -> Bool
isMsg (Msg _) = True
isMsg (Bol _) = False

-- | Check if the given Oursum term indeed a MBool
isBool :: Oursum -> Bool
isBool (Bol _) = True
isBool (Msg _) = False
