%{
#include<stdio.h>

int i = 0;
%}


%%

.		printf(". match %s\n", yytext);
\n		printf("\\n match %d\n", (int)(*yytext));

\"[^"]* {
		if (yytext[yyleng-1] == '\\') {
			i++;
			printf("%d: %s\n", i, yytext);
			yymore();
		}
		else {
			i = 0;
			printf("match pattern is:%s", yytext);
		}
	}

'([^']|\n)+' {
		printf("%s\n", yytext);
	}
%%
