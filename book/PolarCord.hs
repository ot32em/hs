module Test where

data Pos = Cart Double Double | Polar Double Double

dis :: Pos -> Pos -> Double

dis (Cart x1 y1) (Cart x2 y2) = 
    sqrt( (x2-x1)^2 + (y2-y1)^2 )

dis (Cart x1 y1) (Polar r a) =
    let x2 = r * cos a
        y2 = r * sin a
    in dis (Cart x1 y1) (Cart x2 y2)

dis (Polar r a) (Cart x2 y2) =
    let x1 = r * cos a
        y1 = r * sin a
    in dis (Cart x1 y1) (Cart x2 y2)

dis (Polar r1 a1) (Polar r2 a2) =
    let x1 = r1 * cos a1
        y1 = r1 * sin a1
        x2 = r2 * cos a2
        y2 = r2 * sin a2
    in dis (Cart x1 y1) (Cart x2 y2)
