(set-logic HORN)
(declare-fun inv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8) (_ BitVec 8) (_ BitVec 8) ) Bool)
(assert (forall ((k (_ BitVec 8)) (i (_ BitVec 8)) (j (_ BitVec 8)) (n (_ BitVec 8)) (turn (_ BitVec 8))) 
       (=> ( and ( = k (_ bv1 8) ) ( = i (_ bv1 8) ) ( = j (_ bv0 8) ) ( = turn (_ bv0 8) ) ) (inv k i j n turn))))
(assert (forall ((k (_ BitVec 8)) (i (_ BitVec 8)) (j (_ BitVec 8)) (n (_ BitVec 8)) (turn (_ BitVec 8)) (k! (_ BitVec 8)) (i! (_ BitVec 8)) (j! (_ BitVec 8)) (n! (_ BitVec 8)) (turn! (_ BitVec 8))) 
       (=> (and (inv k i j n turn) ( let ( ( a!1 ( and ( = turn (_ bv1 8) ) ( bvult j i ) ( = k! ( bvsub ( bvadd k i ) j ) ) ( = i! i ) ( = j! ( bvadd j (_ bv1 8) ) ) ( = n! n ) ( = turn! turn ) ) ) ) ( or ( and ( = turn (_ bv0 8) ) ( bvult i n ) ( = k! k ) ( = i! i ) ( = j! (_ bv0 8) ) ( = n! n ) ( = turn! (_ bv1 8) ) ) ( and ( = turn (_ bv0 8) ) ( bvuge i n ) ( = k! k ) ( = i! i ) ( = j! j ) ( = n! n ) ( = turn! (_ bv3 8) ) ) a!1 ( and ( = turn (_ bv1 8) ) ( bvuge j i ) ( = k! k ) ( = i! i ) ( = j! j ) ( = n! n ) ( = turn! (_ bv2 8) ) ) ( and ( = turn (_ bv2 8) ) ( = k! k ) ( = i! ( bvadd i (_ bv1 8) ) ) ( = j! j ) ( = n! n ) ( = turn! (_ bv0 8) ) ) ( and ( bvuge turn (_ bv3 8) ) ( = k! k ) ( = i! i ) ( = j! j ) ( = n! n ) ( = turn! turn ) ) ( and ( bvult turn (_ bv0 8) ) ( = k! k ) ( = i! i ) ( = j! j ) ( = n! n ) ( = turn! turn ) ) ) )) (inv k! i! j! n! turn!))))
(assert (forall ((k (_ BitVec 8)) (i (_ BitVec 8)) (j (_ BitVec 8)) (n (_ BitVec 8)) (turn (_ BitVec 8))) 
       (=> (inv k i j n turn) ( => ( = turn (_ bv3 8) ) ( bvuge k n ) ))))
(check-sat)
