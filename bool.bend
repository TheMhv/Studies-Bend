type Bool = true | false

# Show
(Bool.show Bool/true) = "true"
(Bool.show Bool/false) = "false"

# main = (Bool.show Bool/true) # "true"
# main = (Bool.show Bool/false) # "false"

## Not
(Bool.not Bool/true) = Bool/false
(Bool.not Bool/false) = Bool/true

# main = (Bool.show (Bool.not Bool/true)) # false
# main = (Bool.show (Bool.not Bool/false)) # true

# Equal
(Bool.equal Bool/true Bool/true) = Bool/true
(Bool.equal Bool/false Bool/false) = Bool/true
(Bool.equal * *) = Bool/false

# main = (Bool.show (Bool.equal Bool/true Bool/true)) # true
# main = (Bool.show (Bool.equal Bool/false Bool/true)) # false
# main = (Bool.show (Bool.equal Bool/true Bool/false)) # false
# main = (Bool.show (Bool.equal Bool/false Bool/false)) # true

## And
(Bool.and Bool/true Bool/true) = Bool/true
(Bool.and * *) = Bool/false

# main = (Bool.show (Bool.and Bool/true Bool/true)) # true
# main = (Bool.show (Bool.and Bool/false Bool/true)) # false
# main = (Bool.show (Bool.and Bool/true Bool/false)) # false
# main = (Bool.show (Bool.and Bool/false Bool/false)) # false

## Nand
(Bool.nand Bool/true Bool/true) = Bool/false
(Bool.nand * *) = Bool/true

# main = (Bool.show (Bool.nand Bool/true Bool/true)) # false
# main = (Bool.show (Bool.nand Bool/false Bool/true)) # true
# main = (Bool.show (Bool.nand Bool/true Bool/false)) # true
# main = (Bool.show (Bool.nand Bool/false Bool/false)) # true

## Or
(Bool.or Bool/true *) = Bool/true
(Bool.or * Bool/true) = Bool/true
(Bool.or * *) = Bool/false

# main = (Bool.show (Bool.or Bool/true Bool/true)) # true
# main = (Bool.show (Bool.or Bool/false Bool/true)) # true
# main = (Bool.show (Bool.or Bool/true Bool/false)) # true
# main = (Bool.show (Bool.or Bool/false Bool/false)) # false

## Nor
(Bool.nor Bool/false Bool/false) = Bool/true
(Bool.nor * *) = Bool/false

# main = (Bool.show (Bool.nor Bool/true Bool/true)) # false
# main = (Bool.show (Bool.nor Bool/false Bool/true)) # false
# main = (Bool.show (Bool.nor Bool/true Bool/false)) # false
# main = (Bool.show (Bool.nor Bool/false Bool/false)) # true

## Xor
(Bool.xor Bool/true Bool/true) = Bool/false
(Bool.xor Bool/false Bool/false) = Bool/false
(Bool.xor * *) = Bool/true

# main = (Bool.show (Bool.xor Bool/true Bool/true)) # false
# main = (Bool.show (Bool.xor Bool/false Bool/true)) # true
# main = (Bool.show (Bool.xor Bool/true Bool/false)) # true
# main = (Bool.show (Bool.xor Bool/false Bool/false)) # false

## Xnor
(Bool.xnor Bool/true Bool/true) = Bool/true
(Bool.xnor Bool/false Bool/false) = Bool/true
(Bool.xnor * *) = Bool/false

# main = (Bool.show (Bool.xnor Bool/true Bool/true)) # true
# main = (Bool.show (Bool.xnor Bool/false Bool/true)) # false
# main = (Bool.show (Bool.xnor Bool/true Bool/false)) # false
# main = (Bool.show (Bool.xnor Bool/false Bool/false)) # true