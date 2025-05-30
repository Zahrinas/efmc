(set-logic HORN)
(declare-fun inv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) ) Bool)
(assert (forall ((i (_ BitVec 32)) (k (_ BitVec 32)) (n (_ BitVec 32)) (j (_ BitVec 32))) 
       (=> ( and ( = k (_ bv0 32) ) ( = i (_ bv0 32) ) ( = j n ) ) (inv i k n j))))
(assert (forall ((i (_ BitVec 32)) (k (_ BitVec 32)) (n (_ BitVec 32)) (j (_ BitVec 32)) (i! (_ BitVec 32)) (k! (_ BitVec 32)) (n! (_ BitVec 32)) (j! (_ BitVec 32))) 
       (=> (and (inv i k n j) ( or ( and ( bvult i n ) ( = i! ( bvadd i (_ bv1 32) ) ) ( = k! ( bvadd k (_ bv1 32) ) ) ( = n! n ) ( = j! j ) ) ( and ( bvuge i n ) ( bvugt j (_ bv0 32) ) ( = j! ( bvsub j (_ bv1 32) ) ) ( = k! ( bvsub k (_ bv1 32) ) ) ) ( = n! n ) ( = i! i ) )) (inv i! k! n! j!))))
(assert (forall ((i (_ BitVec 32)) (k (_ BitVec 32)) (n (_ BitVec 32)) (j (_ BitVec 32))) 
       (=> (inv i k n j) ( or ( not ( and ( bvuge i n ) ( bvugt j (_ bv0 32) ) ) ) ( bvugt k (_ bv0 32) ) ))))
(check-sat)
