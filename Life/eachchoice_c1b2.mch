MACHINE eachchoice_c1b2
SEES Life

OPERATIONS
  wed(mm, ff,marriage) =
	PRE
  	marriage : male >+> female &
  	not(mm : male) &
  	mm /: dom(marriage) &
  	ff : female &
 	ff /: ran(marriage)
	THEN
  	skip
	END
END


/* animei dnv essa mch no ProB e percebi uma coisa, se vc animar dois males, a operação wed se torna "impossivel" */
/* se vc animar duas females(ou 1 male e 1 female) a operação se torna possivel e ele interpreta o "conjunto" de male como vazio(ou "ignora" ele no caso de animar 1 male) */
/* e com isso é possivel realizar wed tentando "casar" a ff com ela mesma, pelo menos foi isso que eu entendi*/

