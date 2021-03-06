module Types
(Message(EmptyMsg, Name, IfMThenElse)
, MBool(MTrue, MFalse, Bvar), Oursum(..)) where
import Data.Nat
import GHC.Read

instance Read Nat where
  readsPrec n = map (\(x,str) -> (toEnum x,str)) . readsPrec n

  -- | Mutually recursive types Message and Bool

data Message = EmptyMsg
            | Var Nat
            | Name Nat
            | IfMThenElse MBool Message Message
            | Pair Message Message
            | Pi1 Message
            | Pi2 Message
            | To Message
            | Len Message
            | AttComp [Message]
            deriving (Read, Show, Eq)


data MBool = MTrue
            | MFalse
            | Bvar Nat
            | Eqb MBool MBool
            | Eqm Message Message
            | IFBThenElse MBool MBool MBool
            deriving (Read, Show, Eq)

-- | Oursum type

data Oursum = Msg Message| Bol MBool deriving (Read, Show, Eq)
