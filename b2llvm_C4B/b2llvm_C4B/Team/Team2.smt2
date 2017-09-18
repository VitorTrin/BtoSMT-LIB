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

(declare-fun player1 () PLAYER);pp
(declare-fun player2 () PLAYER);rr

(push 1)

(assert (not (member player1 Team)))
(assert (not (not (member player2 Team))))
;(assert (substitute player1 player2))

(check-sat)
(get-value (Team player1 player2))

(pop 1)

;Teste 2:
;not(rr /: team) & pp : PLAYER & pp : team & rr : PLAYER

(push 1)

(assert (not (not (member player2 Team))))
(assert (member player1 Team))
;(assert (substitute player1 player2))

(check-sat)
(get-value (Team player1 player2))

(pop 1)

;Teste 3
;not(pp : team) & pp : PLAYER & rr /: team & rr : PLAYER

(push 1)

(assert (not (member player1 Team)))
(assert (not (member player2 Team)))

(check-sat)
(get-value (Team player1 player2))

(pop 1)


;Teste 4
;pp : PLAYER & pp : team & rr /: team & rr : PLAYER

(push 1)

(assert (member player1 Team))
(assert (not (member player2 Team)))

(check-sat)
(get-value (Team player1 player2))

(pop 1)
