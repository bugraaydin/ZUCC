parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: cs315f17_group33.y lex.yy.c
	yacc cs315f17_group33.y
lex.yy.c: cs315f17_group33.l
	lex cs315f17_group33.l
clean:
	rm -f lex.yy.c y.tab.c parser