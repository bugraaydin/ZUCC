/* proje.y */



%{
#include <stdio.h>
%}


%token BOOL AND OR EQCHECK NOT LP RP IF THEN ELSE WHILE BGN END DO INIT DEFINE INPUT OUTPUT RETURN
%token ASSIGNMENT TERMINATOR COMMA MAIN LCURLY RCURLY C_IDENTIFIER P_IDENTIFIER V_IDENTIFIER  A_IDENTIFIER INDEX

%%	
program: MAIN LCURLY stmts RCURLY {printf("PARSING COMPLETED: THE ZUCCENING WAS SUCCESSFUL\n"); exit(0);}
	;
stmts: stmt | stmts TERMINATOR stmt
	;
stmt: if_stmt | assignment_stmt | init_stmt | while_stmt | output_stmt | predicate_decleration
	;
init_stmt: INIT var_assignment_stmt | INIT C_IDENTIFIER ASSIGNMENT boolean_expr | INIT A_IDENTIFIER ASSIGNMENT LP boolean_exprs RP
	;
assignment_stmt: var_assignment_stmt | arrelement_assignment_stmt
	;
arrelement_assignment_stmt:  arrelement ASSIGNMENT boolean_expr
	;
var_assignment_stmt: V_IDENTIFIER ASSIGNMENT boolean_expr
	;
if_stmt: IF LP boolean_expr RP THEN stmts END | IF LP boolean_expr RP THEN stmts ELSE stmts END
	;
while_stmt: WHILE LP boolean_expr RP DO stmts END
	;
input_stmt: INPUT LP RP
	;
output_stmt: OUTPUT LP boolean_expr RP
	;
predicate_decleration: DEFINE P_IDENTIFIER LP ids RP BGN stmts RETURN boolean_expr END | DEFINE P_IDENTIFIER LP ids RP BGN RETURN boolean_expr END
	;
predicate_call: P_IDENTIFIER LP boolean_exprs RP | P_IDENTIFIER LP RP | input_stmt
	;
boolean_expr: boolean_expr connective boolean_exp2 | boolean_exp2
	;
boolean_exp2: NOT boolean_exp1 | boolean_exp1
	;
boolean_exp1: LP boolean_expr RP | boolean_exp0
	;
boolean_exp0: predicate_call | id
	;
boolean_exprs: boolean_exprs COMMA boolean_expr | boolean_expr
	;
ids: ids COMMA id | id
	;
id: V_IDENTIFIER | arrelement | C_IDENTIFIER | BOOL 
	;
arrelement: A_IDENTIFIER INDEX
	;
connective: AND | OR | EQCHECK	
	;

%%


#include "lex.yy.c"

main(){
	yyparse();
}