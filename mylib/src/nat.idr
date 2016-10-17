||| An abstract data type, nat, simulating
||| the natural numbers and common arithmetic
||| operations involving natural numbers
module nat

-- Some arithmetic functions return Boolean values; so
-- clients will need bool, so we'll import it publicly
import public bool


||| The primary data type we export is Nat.
||| The constructors themselves are private.
export
data Nat =
  ||| Z constructs a representation of zero
  Z |
  ||| S n constructs a representation of the successor of n
  S Nat

-- Values and functions

||| The Nat representing zero
export
nat_zero: Nat
nat_zero = Z


||| The one representing one
export
nat_one: Nat
nat_one = S Z


||| And this one's two
export
nat_two: Nat
nat_two = S nat_one


||| And three
export
nat_three: Nat
nat_three = S nat_two


||| The identity function for values of type Nat
export
nat_id: Nat -> Nat
nat_id n = n


||| Return the (Nat representing the) successor of a given Nat
export
nat_succ: Nat -> Nat
nat_succ n = S n

-- Oh, Huge Yay, and Finally: Arithmetic!

||| Compute the predecessor of a given nat (with pred zero = zero)
export
nat_pred: Nat -> Nat
nat_pred Z = Z
nat_pred (S n) = n


||| Implement a function for computing the sum of two nats
export
nat_plus: Nat -> Nat -> Nat
nat_plus Z n = n
nat_plus (S n) m = S (nat_plus n m)


||| Subtraction
export
nat_minus: Nat -> Nat -> Nat
nat_minus Z m = Z
nat_minus m Z = m
nat_minus (S m) (S n) = nat_minus m n


||| Return true if a given nat is even otherwise false
export
nat_evenb: Nat -> Bool
nat_evenb Z = True
nat_evenb (S Z) = False
nat_evenb (S (S n)) = nat_evenb n

||| Natural number equality
export
nat_eq: Nat -> Nat -> Bool
nat_eq Z Z = True
nat_eq Z (S n) = False
nat_eq (S n) Z = False
nat_eq (S n) (S m) = nat_eq n m


||| Compute the product of two nats
export nat_mult: Nat -> Nat -> Nat
nat_mult Z m = Z
nat_mult (S n) m = nat_plus m (nat_mult n m)


||| Return the factorial of a given nat
||| Recall: if n = 0, n! = 1 and if n > 0, n! = n * (n-1)!
export
nat_fact: Nat -> Nat
nat_fact Z = nat_succ nat_zero
nat_fact (S n) = nat_mult (S n) (nat_fact n)
