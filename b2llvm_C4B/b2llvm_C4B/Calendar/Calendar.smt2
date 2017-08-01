(set-logic ALL)
(set-option :produce-models true)

(declare-fun month (Int) Bool)

(assert
    (forall ((nn Int))
        (=
            (month nn)
            (and
                (>= nn 1)
                (<= nn 12)
            )
        )
    )
)

;Boundary Value Analysis (All-Combinations)
;Teste 1:
;nn = 1+1 && nn = 2
(push 1)

(assert (month 2))
(assert (month (+ 1 1)))

(check-sat)

(pop 1)

(push 1)

(assert (month 11))
(assert (month (- 12 1)))

(check-sat)

(pop 1)

(push 1)

(assert (month 1))

(check-sat)

(pop 1)

(push 1)

(assert (month 12))

(check-sat)

(pop 1)
