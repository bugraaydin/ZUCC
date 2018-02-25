/* proje.l */
%{
#include <stdlib.h>
%}
%option yylineno
BOOL			true|false
AND			\&
OR			\|
EQCHECK			==
NOT			\!
LP			\(
RP			\)
IF			if
THEN			then
ELSE			else
WHILE			while
BGN			begin
END			end
DO			do
INIT			init
DEFINE			define
INPUT			input
OUTPUT			output
RETURN			return
ASSIGNMENT		=
TERMINATOR		\~
COMMA			\,
MAIN			main
LCURLY			\{
RCURLY			\}
COMMENT			"/*"((\*+[^/*])|([^*]))*\**"*/"
C_IDENTIFIER		c_[a-zA-Z_]([a-zA-Z0-9_]*)?
P_IDENTIFIER		p_[a-zA-Z_]([a-zA-Z0-9_]*)?
A_IDENTIFIER		a_[a-zA-Z_]([a-zA-Z0-9_]*)?
INDEX				\[[0-9]+\]
V_IDENTIFIER		[a-zA-Z_]([a-zA-Z0-9_]*)?

%%
\n			;
[ \t]			;
{BOOL}			{return BOOL;}
{AND}			{return AND;}
{OR}			{return OR;}
{EQCHECK}		{return EQCHECK;}
{NOT}			{return NOT;}
{LP}			{return LP;}
{RP}			{return RP;}
{IF}			{return IF;}
{THEN}			{return THEN;}
{ELSE}			{return ELSE;}
{WHILE}			{return WHILE;}
{BGN}			{return BGN;}
{END}			{return END;}
{DO}			{return DO;}
{INIT}			{return INIT;}
{DEFINE}		{return DEFINE;}
{INPUT}			{return INPUT;}
{OUTPUT}		{return OUTPUT;}
{RETURN}		{return RETURN;}
{ASSIGNMENT}		{return ASSIGNMENT;}
{TERMINATOR}		{return TERMINATOR;}
{COMMA}			{return COMMA;}
{MAIN}			{return MAIN;}
{LCURLY}		{return LCURLY;}
{RCURLY}		{return RCURLY;}
{COMMENT}		;
{C_IDENTIFIER}		{return C_IDENTIFIER;}
{P_IDENTIFIER}		{return P_IDENTIFIER;}
{A_IDENTIFIER}		{return A_IDENTIFIER;}
{INDEX}				{return INDEX;}
{V_IDENTIFIER}		{return V_IDENTIFIER;}
.			{ fprintf(stderr,"Unrecognised token %c",yytext[0]);}

%%
int yywrap(){return 1;}

void yyerror(char *str)
{
    fprintf(stderr,"%s on line number: %d\n",str,yylineno);
}