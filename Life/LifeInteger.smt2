(set-logic ALL_SUPPORTED)
(set-option :produce-models true)

(declare-fun male () (Set Int))
(declare-fun female () (Set Int))
(assert (= (intersection male female) (as emptyset (Set Int))))

;(define-fun born ((p Int)) Bool (not (member p (union male female))))
(declare-fun born (Int) Bool)
(assert (forall ((p Int)) (= (born p) (not (member p (union male female))))))
(check-sat)
(get-value (male))
