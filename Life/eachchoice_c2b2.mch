MACHINE Teste
SEES Life

OPERATIONS
  wed(mm, ff,marriage) =
	PRE
  	marriage : male >+> female &
  	mm : male &
  	not(mm /: dom(marriage)) &
  	ff : female &
 	ff /: ran(marriage)
	THEN
  	skip
	END
END


/* Essa mch não foi capaz de ser animada pelo ProB, seria esse requisito inf por si só? */
