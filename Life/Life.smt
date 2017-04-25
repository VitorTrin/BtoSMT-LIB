(set-logic ALL_SUPPORTED)
(set-option :produce-assignments true)
; Person is a set of all people
(declare-sort PERSON 0)
(declare-fun Person () (Set PERSON));
(assert (= Person (as univset (Set PERSON))))

; Sex is the set (boy, girl)
(declare-sort SEX 0); O tipo do conjunto sex
(declare-fun Sex () (Set SEX)); um set com 2 elementos?
(declare-fun boy () SEX)
(declare-fun girl() SEX)
(assert (= Sex (as univset (Set SEX)))); Sex são todos os elementos
(assert (= Sex (insert boy (singleton girl)))); Sex é boy e girl
(assert (not (= boy girl))); membros do conjunto são diferentes entre si

(declare-fun male () PERSON)
(declare-fun female () PERSON)
(assert (= (intersection (singleton male) (singleton female)) (as emptyset (Set PERSON))))s
;(declare-fun born (p PERSON) Bool (member p (union male female)))
;(declare-fun die (nn PERSON) Bool (member nn (union male female)))
;(declare-fun born ((p PERSON)) Bool)
;(define-fun born ((p PERSON)) Bool)
;(declare-fun born (PERSON) Bool)
;(define-fun born ((p PERSON)) Bool (= (born p)(member p Person)))
(define-fun born ((p PERSON)) Bool (or (= p male)(= p female)))
;(assert (forall ((p PERSON)) (= (born p)(member p (union male female)))))
;(assert (forall ((p PERSON)) (= (born p)(member (singleton p) (union (singleton male) (singleton female))))))
;(assert (forall ((p PERSON)) (= (born p)(member p Person)))); funciona, mas dá assert unknown
;(assert (forall ((p PERSON)) (or (= (born p)(member p Person))))
;(assert (forall ((p PERSON)) (or (= (born p)(male)) (= (born p) (female)))))
;(declare-fun die ((p PERSON)))
(define-fun die ((p PERSON)) Bool (or (= p male)(= p female)))

;Marriage

; Como fazer injeção parcial?
(declare-fun marriage (male) female); mapeia um male para um female. faz sentido? aqui male é só um membro e não um subconjunto
(assert (forall () ) )
