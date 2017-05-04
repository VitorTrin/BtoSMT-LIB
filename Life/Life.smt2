(set-logic ALL_SUPPORTED)
(set-option :produce-models true)
;(set-option :produce-proofs true)
;(set-option :produce-unsat-assumptions true)
;(set-option :produce-unsat-cores true)

; Person is a set of all people
(declare-sort PERSON 0)
(declare-fun Person () (Set PERSON));

; Sex is the set (boy, girl)
(declare-sort SEX 0); O tipo do conjunto sex
(declare-fun Sex () (Set SEX)); um set com 2 elementos?
(declare-fun boy () SEX)
(declare-fun girl() SEX)
(assert (= Sex (as univset (Set SEX)))); Sex são todos os elementos
(assert (= Sex (insert boy (singleton girl)))); Sex é boy e girl
(assert (not (= boy girl))); membros do conjunto são diferentes entre si

(declare-fun male () (Set PERSON))

(declare-fun female () (Set PERSON))
(assert (= (intersection male female) (as emptyset (Set PERSON))))

(define-fun born ((p PERSON)) Bool (not (member p (union male female))))
(define-fun die ((p PERSON)) Bool (member p (union male female)))
;(assert (not ( = male (as emptyset (Set PERSON)))))
;(assert (not ( = female (as emptyset (Set PERSON)))))
;(check-sat)
;(get-value (male female))


;Marriage

;(declare-fun marriage (male) female); mapeia um male para um female. faz sentido? aqui male é só um membro e não um subconjunto
(declare-fun domMarriage () (Set PERSON)); domínio do marriage
(assert (subset domMarriage male))
(declare-fun imgMarriage () (Set PERSON))
(assert (subset imgMarriage female))

(declare-fun marriage (PERSON) PERSON); consigo especificar que ele é (domMale) para female aqui?

;definindo imagem e dominio
(assert
  (forall((do PERSON)(im PERSON))
    (=>
      (= (marriage do) im)
      (and
        (member do domMarriage)
        (member im imgMarriage)
      )
    )
  )
)
;injetora com implicação

;especificando que ele é parcial injetora
(assert
  (forall((a PERSON)(b PERSON))
    (=>
      (= (marriage a) (marriage b))
      (= a b)
    )
  )
)

;wed
(define-fun wed ((mm PERSON)(ff PERSON)) Bool (
  and (member mm male)
      (not (member mm domMarriage))
      (member ff female)
      (not (member ff imgMarriage))
  ))

;part
(define-fun part ((mm PERSON)(ff PERSON)) Bool (
  and (member mm male)
      (member ff female)
      (= (marriage mm) ff); se eles são casados
  ))

;eachchoice_c1b2

;marriage : male >+> female já foi definido, é aquele assert enorme
;(declare-fun testm () (Set PERSON)); essa variável não tinha o tipo bem definido
;(declare-fun testf () (Set PERSON))
;(assert (and (not (= testm male));not(mm : male)
;     (not (subset testm domMarriage))
;     (= testf female)
;     (not (subset testf imgMarriage))
;     )
;)

;eachchoice_c2b2
;(declare-fun testmc2b2 () (Set PERSON)); essa variável não tinha o tipo bem definido
;(declare-fun testfc2b2 () (Set PERSON))
;(assert (and (= testmc2b2 male);not(mm : male)
;     (subset testmc2b2 domMarriage)
;     (= testfc2b2 female)
;     (not (subset testfc2b2 imgMarriage))
;     )
;)

(check-sat)
;(get-proof)
;(get-unsat-core)
;(get-unsat-assumptions)
;(get-value (testm testf))
