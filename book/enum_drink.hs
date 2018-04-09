-- try Enum

module Drink where

data Drink = Water | Tea | Milk | MilkTea

instance Enum Drink where
    fromEnum Water = 0
    fromEnum Tea = 1
    fromEnum Milk = 2
    fromEnum MilkTea = 3
    toEnum 0 = Water
    toEnum 1 = Tea
    toEnum 2 = Milk
    toEnum 3 = MilkTea

instance Show Drink where
    show Water = "Water"
    show Tea = "Tea"
    show Milk = "Milk"
    show MilkTea = "MilkTea"

instance Eq Drink where
    (==) a b = fromEnum a == fromEnum b

instance Ord Drink where
    compare a b = compare (fromEnum a) (fromEnum b)

instance Num Drink where
    (+) Water Water = Water
    (+) Water Tea = Tea
    (+) Water Milk = Milk
    (+) Water MilkTea = MilkTea
    (+) Tea Water = Water + Tea
    (+) Tea Tea = Tea
    (+) Tea Milk = MilkTea
    (+) Tea MilkTea = MilkTea
    (+) Milk Water = Water + Milk
    (+) Milk Tea = Tea + Milk
    (+) Milk Milk = Milk
    (+) Milk MilkTea = MilkTea
    (+) MilkTea Water = Water + MilkTea
    (+) MilkTea Tea = Tea + MilkTea
    (+) MilkTea Milk = Milk + MilkTea
    (+) MilkTea MilkTea = MilkTea
    

    
    (-) Water Water = Water
    (-) Water Tea = Water
    (-) Water Milk = Water
    (-) Water MilkTea = Water
    (-) Tea Water = Tea
    (-) Tea Tea = Water
    (-) Tea Milk = Tea
    (-) Tea MilkTea = Water
    (-) Milk Water = Milk
    (-) Milk Tea = Milk
    (-) Milk Milk = Water
    (-) Milk MilkTea = Water
    (-) MilkTea Water = MilkTea
    (-) MilkTea Tea = Milk
    (-) MilkTea Milk = Tea
    (-) MilkTea MilkTea = Water

    (*) = const            -- ignore 
    negate = id            -- ignore
    abs = id               -- ignore
    signum = id            -- ignore
    fromInteger _ = Water  -- ignore

drinkIt :: IO()
drinkIt = do    
    print $ Milk - Milk
    print $ Water + Milk
    print $ Milk + Milk
    print $ Tea + Milk
    print $ MilkTea - Milk