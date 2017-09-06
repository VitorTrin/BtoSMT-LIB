(set-logic ALL)
(set-option :produce-models true)

;"CONSTANTES" com aspas suspeitas
;Não existe MAXINT em SMT-LIB, inteiros vão até onde o solver conseguir
(declare-const MAXINT Int)
(assert (= MAXINT 255))
(declare-const MININT Int)
(assert (= MININT (- 255)))

;Invariantes
(declare-fun value () Int)
(declare-fun overflow () Bool)
(declare-fun underflow () Bool)
(assert (>= value MININT))
(assert (<= value MAXINT))
(assert
    (=>
        underflow
        (= value MININT)
    )
)
(assert
    (=>
        overflow
        (= value MAXINT)
    )
)

;Operações
(declare-fun inc () Bool)
(assert
    (=
        inc
        (and
            (>= value MININT)
            (<= value MAXINT)
        )
    )
)
(declare-fun dec () Bool)
(assert
    (=
        dec
        (and
            (>= value MININT)
            (<= value MAXINT)
        )
    )
)

(check-sat)

;Testing Strategy: Input Space Partition
;Coverage Criterion: Equivalent Classes (Each-choice)

;Teste 1
;Formula: not(value > MININT) & value : MININT..MAXINT
(echo "teste 1 de Count")

(push 1)

(assert (and (not (> value MININT)) (and (>= value MININT) (<= value MAXINT))))

(check-sat)
(get-value (value underflow overflow))

(pop 1)

;Teste 2
;Formula: not(value < MAXINT) & value : ((MAXINT + 1))..MAXINT
(echo "teste 2 de Count")

(push 1)

(assert (and (not (< value MAXINT)) (and (>= value (+ MAXINT 1)) (<= value MAXINT))))

(check-sat)
;(get-value (value underflow overflow))

(pop 1)

;Teste 3
;Formula: value : MININT..((MININT - 1)) & value < MAXINT

(echo "teste 3 de Count")

(push 1)

(assert (and (and (>= value MININT) (<= value (- MININT 1))) (< value MAXINT)))

(check-sat)
(get-value (value underflow overflow))
