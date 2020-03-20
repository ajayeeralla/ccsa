module Mylist where
import Data.List.Indexed.Counted
import Types as T
import Data.Numeric.Witness.Peano



type Mylist n = CountedList n Oursum

lenMl = count

--lenMl :: Mylist n -> Natural n
--lenMl ml = count ml

---x = (Bol T.True ::: Bol T.False ::: CountedNil)





checkMsg :: Oursum -> Prelude.Bool
checkMsg m = case m of (Msg _) -> Prelude.True
                       (Bol _) -> Prelude.False

checkBol :: Oursum -> Prelude.Bool
checkBol b = case b of (Msg _) -> Prelude.False
                       (Bol _) -> Prelude.True
