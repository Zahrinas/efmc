(set-logic HORN)
(declare-fun inv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) ) Bool)
(assert (forall ((lo (_ BitVec 64)) (mid (_ BitVec 64)) (hi (_ BitVec 64))) 
       (=> ( and ( = lo (_ bv0 64) ) ( bvsgt mid (_ bv0 64) ) ( = hi ( bvmul (_ bv2 64) mid ) ) ) (inv lo mid hi))))
(assert (forall ((lo (_ BitVec 64)) (mid (_ BitVec 64)) (hi (_ BitVec 64)) (lo! (_ BitVec 64)) (mid! (_ BitVec 64)) (hi! (_ BitVec 64))) 
       (=> (and (inv lo mid hi) ( and ( bvsgt mid (_ bv0 64) ) ( = lo! ( bvadd lo (_ bv1 64) ) ) ( = hi! ( bvsub hi (_ bv1 64) ) ) ( = mid! ( bvsub mid (_ bv1 64) ) ) )) (inv lo! mid! hi!))))
(assert (forall ((lo (_ BitVec 64)) (mid (_ BitVec 64)) (hi (_ BitVec 64))) 
       (=> (inv lo mid hi) ( or ( bvsgt mid (_ bv0 64) ) ( = lo hi ) ))))
(check-sat)
