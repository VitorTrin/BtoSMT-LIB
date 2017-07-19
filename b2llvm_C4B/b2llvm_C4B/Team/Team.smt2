(set-logic ALL)
(set-option :produce-models true)

;Declaração de Player
(declare-sort PLAYER 0)
(declare-fun Team () (Set PLAYER))

;Cardinalidade de Player

(assert (= (card Team) 11))

(push 1)

(check-sat)
(get-value (Team))

(pop 1)


(declare-fun substitute (PLAYER PLAYER) Bool)
(assert
    (forall ((pp PLAYER) (rr PLAYER))
        (=
            (substitute pp rr)
            (and
                (member pp Team)
                (not(member rr Team))
            )
        )
    )
)

;Teste 1:
;not(pp : team) & not(rr /: team) & pp : PLAYER & rr : PLAYER

(declare-fun player1 () PLAYER)
(declare-fun player2 () PLAYER)

(push 1)

(assert (not (member player1 Team)))
(assert (not (not (member player2 Team))))
(assert (substitute player1 player2))

(check-sat)
(get-value (Team))
