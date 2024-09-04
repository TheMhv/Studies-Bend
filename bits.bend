type Bits
  = e
  | (o ~pred)
  | (i ~pred)

# Show
(Bits.show Bits/e) = (String/Nil)
(Bits.show (Bits/o pred)) = (String/Cons '0' (Bits.show(pred)))
(Bits.show (Bits/i pred)) = (String/Cons '1' (Bits.show(pred)))

# Bitwise NOT
(Bits.not Bits/e) = (Bits/e)
(Bits.not (Bits/o pred)) = (Bits/i (Bits.not(pred)))
(Bits.not (Bits/i pred)) = (Bits/o (Bits.not(pred)))

# Bitwise AND
(Bits.and (Bits/o x.pred) (Bits/o y.pred)) = (Bits/o (Bits.and x.pred y.pred))
(Bits.and (Bits/i x.pred) (Bits/o y.pred)) = (Bits/o (Bits.and x.pred y.pred))
(Bits.and (Bits/o x.pred) (Bits/i y.pred)) = (Bits/o (Bits.and x.pred y.pred))
(Bits.and (Bits/i x.pred) (Bits/i y.pred)) = (Bits/i (Bits.and x.pred y.pred))
(Bits.and * *) = (Bits/e)

# Bitwise OR
(Bits.or (Bits/o x.pred) (Bits/o y.pred)) = (Bits/o (Bits.or x.pred y.pred))
(Bits.or (Bits/i x.pred) (Bits/o y.pred)) = (Bits/i (Bits.or x.pred y.pred))
(Bits.or (Bits/o x.pred) (Bits/i y.pred)) = (Bits/i (Bits.or x.pred y.pred))
(Bits.or (Bits/i x.pred) (Bits/i y.pred)) = (Bits/i (Bits.or x.pred y.pred))
(Bits.or * *) = (Bits/e)

# Bitwise XOR
(Bits.xor (Bits/o x.pred) (Bits/o y.pred)) = (Bits/o (Bits.xor x.pred y.pred))
(Bits.xor (Bits/i x.pred) (Bits/o y.pred)) = (Bits/i (Bits.xor x.pred y.pred))
(Bits.xor (Bits/o x.pred) (Bits/i y.pred)) = (Bits/i (Bits.xor x.pred y.pred))
(Bits.xor (Bits/i x.pred) (Bits/i y.pred)) = (Bits/o (Bits.xor x.pred y.pred))
(Bits.xor * *) = (Bits/e)

# Concat
(Bits.concat Bits/e y) = (y)
(Bits.concat (Bits/o pred) y) = (Bits/o (Bits.concat pred y))
(Bits.concat (Bits/i pred) y) = (Bits/i (Bits.concat pred y))

# Rotr
(Bits.rotr Bits/e) = (Bits/e)
(Bits.rotr (Bits/o pred)) = (Bits.concat pred (Bits/o (Bits/e)))
(Bits.rotr (Bits/i pred)) = (Bits.concat pred (Bits/i (Bits/e)))

# Shift
(Bits.shft Bits/e) = (Bits/e)
(Bits.shft (Bits/o pred)) = (Bits.concat pred (Bits/o (Bits/e)))
(Bits.shft (Bits/i pred)) = (Bits.concat pred (Bits/o (Bits/e)))

# Incremment
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