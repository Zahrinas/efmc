(set-logic BV)

(synth-inv inv_fun ((j (_ BitVec 64))(i (_ BitVec 64))))

(define-fun pre_fun ((j (_ BitVec 64)) (i (_ BitVec 64))) Bool
       ( and ( = i #x0000000000000001 ) ( = j #x000000000000000a ) ))
(define-fun trans_fun ((j! (_ BitVec 64)) (i! (_ BitVec 64)) (j (_ BitVec 64)) (i (_ BitVec 64))) Bool
       ( and ( bvuge j i ) ( = i! ( bvadd i #x0000000000000002 ) ) ( = j! ( bvadd j ( bvsub #x0000000000000000 #x0000000000000001 ) ) ) ))
(define-fun post_fun ((j (_ BitVec 64)) (i (_ BitVec 64))) Bool
       ( or ( bvule i j ) ( = j #x0000000000000006 ) ))

(inv-constraint inv_fun pre_fun trans_fun post_fun)

(check-synth)

