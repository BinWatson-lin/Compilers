%{
#include <stdio.h>
%}

%%
[a*b?]+				printf("a...ba...b\n");
[a-zA-Z0-9]+"++"	printf("Letter|digit++\n");
[a-zA-Z_][a-zA-Z_0-9]*	printf("identifier\n");
%%
