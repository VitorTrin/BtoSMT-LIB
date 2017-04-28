(set-logic ALL_SUPPORTED)
(set-option :produce-models true)
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

(declare-fun male () (Set PERSON))

(declare-fun female () (Set PERSON))
(assert (= (intersection male female) (as emptyset (Set PERSON))))

(define-fun born ((p PERSON)) Bool (not (member p (union male female))))
(define-fun die ((p PERSON)) Bool (member p (union male female)))
(check-sat)
(get-value (male female))


;Marriage

; Como fazer injeção parcial?
;(declare-fun marriage (male) female); mapeia um male para um female. faz sentido? aqui male é só um membro e não um subconjunto
;(assert (forall () ) )
(declare-fun domMarriage () (Set PERSON)); domínio do marriage
(assert (subset domMarriage male))
(declare-fun marriage (PERSON) PERSON); consigo especificar que ele é (domMale) para female aqui?
(assert
  (forall((a PERSON)(b PERSON))
    (ite
      (and
        (member a domMarriage)
        (member b domMarriage); se eles são membros do dominio
      )
      (ite
        (= (marriage a) (marriage b)); se eles reultam no mesmo female
        (= a b)
        true
      );se eles não resultam igual, sei lá, qualquer coisa vale
      true
    );se não pertencem ao domínio qualquer coisa vale
  )
)
