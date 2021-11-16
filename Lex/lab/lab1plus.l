%{
#include <stdio.h>
%}

		enum symbol {
			nul, ident, number,
			becomes, plus, minus, times, slash,
			eql, neq, lss, leq, gtr, geq,
			lparen, rparen, comma, semicolon, period,
			beginsym, endsym, ifsym, thensym, whilesym,
			dosym, varsym, constsym, oddsym, procsym, callsym,
			readsym, writesym,
			//在此开始增加单词
			OutStr, //单引号括起来的输出字符串
			Lsquare, Rsquare, //[ ]
			breaksym,//break关键字
			forsym, stepsym, untilsym,//for,step,until关键字
		};

%%
begin/([[:blank:]|\n])	printf("<begin, %d>\n", beginsym);
break/([[:blank:]|\n])	printf("<break, %d>\n", breaksym);
call/([[:blank:]|\n])	printf("<call, %d>\n", callsym);
const/([[:blank:]|\n])	printf("<const, %d>\n", constsym);
do/([[:blank:]|\n])		printf("<do, %d>\n", dosym);
end/([[:blank:]|\n])		printf("<end, %d>\n", endsym);
if/([[:blank:]|\n])		printf("<if, %d>\n", ifsym);
odd/([[:blank:]|\n])		printf("<odd, %d>\n", oddsym);
procedure/([[:blank:]|\n])	printf("<procedure, %d>\n", procsym);
read/([[:blank:]|\n])	printf("<read, %d>\n", readsym);
write/([[:blank:]|\n])	printf("<writes, %d>\n", writesym);
step/([[:blank:]|\n])	printf("<step, %d>\n", stepsym);
then/([[:blank:]|\n])	printf("<then, %d>\n", thensym);
until/([[:blank:]|\n])	printf("<until, %d>\n", untilsym);
var/([[:blank:]|\n])	printf("<var, %d>\n", varsym);
while/([[:blank:]|\n]) 	printf("<while, %d>\n", whilesym);
for/([[:blank:]|\n])	printf("<for, %d>\n", forsym);

"+"		printf("<'+', %d>\n", plus);
"-"		printf("<'-', %d>\n", minus);
":="	printf("<'=', %d>\n", eql);
"<"		printf("<'<', %d>\n", lss);
">"		printf("<'>', %d>\n", gtr);
"<="	printf("<'<=', %d>\n", leq);
">="	printf("<'>=', %d>\n", geq);
"*"		printf("<'*', %d>\n", times);	
"/"		printf("<'/', %d>\n", slash);

"#"		printf("<'#', %d>\n", period);
"["		printf("<'[', %d>\n", Lsquare);
"]"		printf("<']', %d>\n", Rsquare);
"("		printf("<'(', %d>\n", lparen);
")"		printf("<')', %d>\n", rparen);
","		printf("<',', %d>\n", comma);
";"		printf("<';', %d>\n", semicolon);

[_a-zA-Z][a-zA-Z0-9_]*/([[:blank:]]|\n)	printf("<Identifier, %d>\n", ident);
[0-9]+/([[:blank:]]|\n)	printf("<Integer, tabptr>\n");
[1-9][0-9]*"."[0-9]*/([[:blank:]]|\n)	printf("<Float, tabptr>\n");
\".+\"				printf("<String, tabptr>\n");

.		;
\n		;
%%
