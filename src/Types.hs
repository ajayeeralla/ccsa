module Types where
import Data.TypeNat.Nat

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
            deriving (Eq)


data MBool = MTrue
            | MFalse
            | Bvar Nat
            | Eqb MBool MBool
            | Eqm Message Message
            | IFBThenElse MBool MBool MBool
            deriving (Eq)

-- | Oursum type

data Oursum = Msg Message| Bol MBool deriving (Eq)
