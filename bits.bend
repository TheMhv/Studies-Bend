type Bits
  = e
  | (o ~pred)
  | (i ~pred)

# Show
(Bits.show Bits/e) = (String/Nil)
(Bits.show (Bits/o pred)) = (String/Cons '0' (Bits.show(pred)))
(Bits.show (Bits/i pred)) = (String/Cons '1' (Bits.show(pred)))

# Bitwise Not
(Bits.not Bits/e) = (Bits/e)
(Bits.not (Bits/o pred)) = (Bits/i (Bits.not(pred)))
(Bits.not (Bits/i pred)) = (Bits/o (Bits.not(pred)))

# Concat
(Bits.concat Bits/e y) = (y)
(Bits.concat (Bits/o pred) y) = (Bits/o (Bits.concat pred y))
(Bits.concat (Bits/i pred) y) = (Bits/i (Bits.concat pred y))

# Rotr
(Bits.rotr Bits/e) = (Bits/e)
(Bits.rotr (Bits/o pred)) = (Bits.concat pred (Bits/o (Bits/e)))
(Bits.rotr (Bits/i pred)) = (Bits.concat pred (Bits/i (Bits/e)))