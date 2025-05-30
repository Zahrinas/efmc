(set-logic BV)

(synth-inv inv_fun ((m (_ BitVec 64))(n (_ BitVec 64))(i (_ BitVec 64))(j (_ BitVec 64))(k (_ BitVec 64))(y (_ BitVec 64))(x (_ BitVec 64))))

(define-fun pre_fun ((m (_ BitVec 64)) (n (_ BitVec 64)) (i (_ BitVec 64)) (j (_ BitVec 64)) (k (_ BitVec 64)) (y (_ BitVec 64)) (x (_ BitVec 64))) Bool
       ( and ( = ( bvadd x y ) k ) ( = m #x0000000000000000 ) ( = j #x0000000000000000 ) ))
(define-fun trans_fun ((m! (_ BitVec 64)) (n! (_ BitVec 64)) (i! (_ BitVec 64)) (j! (_ BitVec 64)) (k! (_ BitVec 64)) (y! (_ BitVec 64)) (x! (_ BitVec 64)) (m (_ BitVec 64)) (n (_ BitVec 64)) (i (_ BitVec 64)) (j (_ BitVec 64)) (k (_ BitVec 64)) (y (_ BitVec 64)) (x (_ BitVec 64))) Bool
       ( let ( ( a!1 ( or ( and ( bvult j n ) ( = j i ) ( = x! ( bvadd x #x0000000000000001 ) ) ( = y! ( bvsub y #x0000000000000001 ) ) ( = k! k ) ( = j! ( bvadd j #x0000000000000001 ) ) ( = i! i ) ( = n! n ) ( = m! m ) ) ( and ( bvult j n ) ( = j i ) ( = x! ( bvadd x #x0000000000000001 ) ) ( = y! ( bvsub y #x0000000000000001 ) ) ( = k! k ) ( = j! ( bvadd j #x0000000000000001 ) ) ( = i! i ) ( = n! n ) ( = m! j ) ) ( and ( bvult j n ) ( not ( = j i ) ) ( = x! ( bvsub x #x0000000000000001 ) ) ( = y! ( bvadd y #x0000000000000001 ) ) ( = k! k ) ( = j! ( bvadd j #x0000000000000001 ) ) ( = i! i ) ( = n! n ) ( = m! m ) ) ( and ( bvult j n ) ( not ( = j i ) ) ( = x! ( bvsub x #x0000000000000001 ) ) ( = y! ( bvadd y #x0000000000000001 ) ) ( = k! k ) ( = j! ( bvadd j #x0000000000000001 ) ) ( = i! i ) ( = n! n ) ( = m! j ) ) ( and ( bvuge j n ) ( = x! x ) ( = y! y ) ( = k! k ) ( = j! j ) ( = i! i ) ( = n! n ) ( = m! m ) ) ) ) ) ( and a!1 ) ))
(define-fun post_fun ((m (_ BitVec 64)) (n (_ BitVec 64)) (i (_ BitVec 64)) (j (_ BitVec 64)) (k (_ BitVec 64)) (y (_ BitVec 64)) (x (_ BitVec 64))) Bool
       ( or ( not ( bvule n j ) ) ( and ( = ( bvadd x y ) k ) ( or ( = n #x0000000000000000 ) ( bvule m n ) ) ) ))

(inv-constraint inv_fun pre_fun trans_fun post_fun)

(check-synth)

