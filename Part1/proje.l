BOOL				true|false
AND				\&
OR				\|
EQCHECK				==
NOT				\!
LP				\(
RP				\)
IF				if
THEN				then
ELSE				else
WHILE				while
BEGIN				begin
END				end
DO				do
INIT				init
DEFINE				define
INPUT				input
OUTPUT				output
RETURN				return
ASSIGNMENT			=
NEWLINE				\n
TERMINATOR			\~
COMMENT				"/*"((\*+[^/*])|([^*]))*\**"*/"
C_IDENTIFIER			c_[a-zA-Z_]([a-zA-Z0-9_]*)?
F_IDENTIFIER			f_[a-zA-Z_]([a-zA-Z0-9_]*)?
IDENTIFIER			[a-zA-Z_]([a-zA-Z0-9_]*)?

%%

{BOOL}			{printf ("BOOL ");}
{AND}			{printf ("AND ");}
{OR}			{printf ("OR ");}
{EQCHECK}		{printf ("EQCHECK ");}
{NOT}			{printf ("NOT ");}
{LP}			{printf ("LP ");}
{RP}			{printf ("RP ");}
{IF}			{printf ("IF ");}
{THEN}			{printf ("THEN ");}
{ELSE}			{printf ("ELSE ");}
{WHILE}			{printf ("WHILE ");}
{BEGIN}			{printf ("BEGIN ");}
{END}			{printf ("END ");}
{DO}			{printf ("DO ");}
{INIT}			{printf ("INIT ");}
{DEFINE}		{printf ("DEFINE ");}
{INPUT}			{printf ("INPUT ");}
{OUTPUT}		{printf ("OUTPUT ");}
{RETURN}		{printf ("RETURN ");}
{ASSIGNMENT}		{printf ("ASSIGNMENT ");}
{NEWLINE}		{printf ("\n");}
{TERMINATOR}		{printf ("TERMINATOR ");}
{COMMENT}		{printf ("");}
{C_IDENTIFIER}		{printf ("C_IDENTIFIER ");}
{F_IDENTIFIER}		{printf ("F_IDENTIFIER ");}
{IDENTIFIER}		{printf ("IDENTIFIER ");}


%%
int main() {
	yylex();
	return 0;
}
