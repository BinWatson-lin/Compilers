%{
#include <stdio.h>
%}
	int lengs[100];
%%
[a-z]+	{
			lengs[yyleng]++;
			printf("lengs[%d] = %d\n", yyleng, lengs[yyleng]);
	}
.			|
\n			;
%%

int yywarp() {
	int i;
	printf("Length No. words\n");
	for (i = 0; i < 100; ++i) {
		if (lengs[i] > 0)
			printf("%5d%10d\n", i,lengs[i]);
	}
	return(1);
}
