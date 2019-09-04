/*----------------------- EXPERIMENT 1 -------------------------------*/
  
%{
#include<math.h>
%}

DIGIT [0-9]
ID    [a-z][a-z0-9]*|[A-Z][A-Z0-9]*|[_][a-z][a-z0-9]*|[A-Z][a-z0-9]*|[a-z][A-Z0-9]*

%%

{DIGIT}+		{printf ("Integer : %s (%d) \n ",yytext, atoi(yytext));}
{DIGIT}+"."{DIGIT}*	{printf("Float : %s (%g) \n ",yytext, atoi(yytext));}
		
False|class|finally|is|return|None|continue|for|lambda|try|True|def|from|nonlocal|while|and|del|global|not|with|as|elif|if|or|yield|assert|else|import|pass|break|except|in|raise|print {printf("Keyword : %s \n ",yytext);}

\".*\"			printf( "string : %s \n", yytext);

{ID}			printf("Identifier %s \n",yytext) ;
"+"|"-"|"*"|"/"|"%"|"//"|"**" printf("arithmetic operator : %s \n", yytext);
"+="|"-="|"*="|"/="|"="|"//="|"**="|"&="|"~="|"!="|">>="|"<<=" printf("assignment operator : %s \n", yytext);
"is"|"is not" 		printf("identity operator : %s \n ", yytext);
"in"|"in not" 		printf("membership operator : %s \n", yytext);
"&"|"|"|"^"|"~"|"<<"|">>" printf("bitwise operator : %s \n", yytext);

"{"[^}\n]*"}" /*new line*/


[\t\n]+ /*white space*/

. 	/* printf("unrecogised char %s \n",yytext);*/

%%


main(argc,argv)
int argc;
char **argv;
	{
	extern FILE *yyin;
	++argv, --argc;
	yyin=fopen("name.py","r+");
	yylex();
	}
