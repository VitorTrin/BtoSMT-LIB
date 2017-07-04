(set-logic ALL)
(set-option :produce-models true)

(declare-fun account_id () Int)
(declare-fun account_balance () Int)

(assert (> account_id 0))
(assert (>= account_balance 0))

(echo "teste 1 de balance")
;Input Space, pairwise
;

(push 1)

(check-sat)
(get-value (account_id account_balance))

(pop 1)


(echo "teste 2 de balance")
;Input Space, each choice


;definição de deposit
(declare-fun deposit (Int) Bool)
(assert
    (forall ((mm Int))
        (=
            (deposit mm)
            (> mm 0)
        )
    )
)

(push 1)

(check-sat)
(get-value (account_id account_balance))

(pop 1)

(echo "teste 1 de deposit")
;Input Space, all-combinations
; Formula: Formula: mm : INT & mm > 0

(push 1)

(check-sat)
(get-value (account_id account_balance))

(pop 1)

(echo "teste 2 de deposit")
;Input Space, all-combinations
;Formula: mm : INT & not(mm > 0)
(push 1)

(assert
    (forall ((mm Int))
        (=
            (deposit mm)
            (not(> mm 0))
        )
    )
)

(check-sat)
(get-value (account_id account_balance))

(pop 1)

;(echo "teste 3 de deposit")
;;Input Space, all-combinations
;;Formula: mm : INT & mm > 0
;;initialisation({account_id=12, account_balance=0})
;
;(push 1)
;
;
;(check-sat)
;(get-value (account_id account_balance))
;
;(pop 1)

;teste 4 de deposit é igual ao 2
;pairwise  de deposit já foi coberto

(declare-fun withdraw (Int) Bool)
(assert
    (forall ((mm Int))
        (=
            (withdraw mm)
            (and
                (> mm 0)
                (> account_balance mm))
        )
    )
)

(echo "teste 1 de withdraw")
;Input Space, All-Combinations
;Formula: account_balance >= mm & mm : INT & mm > 0

(push 1)

(declare-fun x1 () Int)
(assert (>= account_balance x1))
(assert (> x1 0))

(check-sat)
(get-value (account_id account_balance x1))

(pop 1)
