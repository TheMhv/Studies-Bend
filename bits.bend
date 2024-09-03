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

# Incr
(Bits.incr Bits/e) = (Bits/i (Bits/e))
(Bits.incr (Bits/o pred)) = (Bits/i (pred))
(Bits.incr (Bits/i pred)) = (Bits/o (Bits.incr(pred)))

# Sum
(Bits.sum Bits/e Bits/e) = (Bits/e)
(Bits.sum Bits/e y) = (y)
(Bits.sum x Bits/e) = (x)
(Bits.sum (Bits/o x.pred) (Bits/o y.pred)) = (Bits/o (Bits.sum x.pred y.pred))
(Bits.sum (Bits/i x.pred) (Bits/o y.pred)) = (Bits/i (Bits.sum x.pred y.pred))
(Bits.sum (Bits/o x.pred) (Bits/i y.pred)) = (Bits/i (Bits.sum x.pred y.pred))
(Bits.sum (Bits/i x.pred) (Bits/i y.pred)) = (Bits/o (Bits.incr (Bits.sum x.pred y.pred)))