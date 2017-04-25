MACHINE Teste
SEES Life

OPERATIONS
  wed(mm, ff,marriage) =
	PRE
  	marriage : male >+> female &
  	mm : male &
  	mm /: dom(marriage) &
  	not(ff : female) &
 	ff /: ran(marriage)
	THEN
  	skip
	END
END


/* Nessa mch acontence o msm que na mchc1b2, a unica diferença é que aqui acontence pra variavel mm e não para ff */
