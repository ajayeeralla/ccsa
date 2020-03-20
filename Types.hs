module Types where
import Data.Number.Nat

-- | Mutually recursive types Message and Bool

data Message = EmptyMsg
            | Var Nat
            | Name Nat
            | IfMThenElse Types.Bool Message Message
            | Pair Message Message
            | Pi1 Message
            | Pi2 Message
            | To Message
            | Len Message
            | AttComp [Message]
            deriving (Read, Show, Eq, Ord)


data Bool = True
            | False
            | Bvar Nat
            | Eqb Types.Bool Types.Bool
            | Eqm Message Message
            | IFBThenElse Types.Bool Types.Bool Types.Bool
            deriving (Read, Show, Eq, Ord)

-- | Oursum type

data Oursum = Msg Message| Bol Types.Bool deriving (Read, Show, Eq, Ord)
