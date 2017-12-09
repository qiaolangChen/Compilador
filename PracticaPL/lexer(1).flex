import java_cup.runtime.*;

%%

%class AnalizadorLexico
%unicode
%cup

%%

program|PROGRAM {return new Symbol(sym.program);}
begin|BEGIN {return new Symbol(sym.begin);}
end|END {return new Symbol(sym.end);}
const|CONST {return new Symbol(sym.const_);}
var|VAR {return new Symbol(sym.var);}
procedure|PROCEDURE {return new Symbol(sym.procedure);}
function|FUNCTION {return new Symbol(sym.function);}
integer|INTEGER {return new Symbol(sym.integer);}
real|REAL {return new Symbol(sym.real);}
char|CHAR {return new Symbol(sym.char_);}
type|TYPE {return new Symbol(sym.type);}
array|ARRAY {return new Symbol(sym.array);}
of|OF {return new Symbol(sym.of);}
record|RECORD {return new Symbol(sym.record);}
if|IF {return new Symbol(sym.if_);}
then|THEN {return new Symbol(sym.then);}
else|ELSE {return new Symbol(sym.else_);}
while|WHILE {return new Symbol(sym.while_);}
do|DO {return new Symbol(sym.do_);}
for|FOR {return new Symbol(sym.for_);}
to|TO {return new Symbol(sym.to);}
case|CASE {return new Symbol(sym.case_);}	
:= {return new Symbol(sym.op_asignacion);}
\< {return new Symbol(sym.op_menor);}
\> {return new Symbol(sym.op_mayor);}
\<= {return new Symbol(sym.op_menorIgual);}
\>= {return new Symbol(sym.op_mayorIgual);}
= {return new Symbol(sym.op_igual);}
\<\> {return new Symbol(sym.op_distinto);}
\+ {return new Symbol(sym.op_suma);}
- {return new Symbol(sym.op_resta);}
\* {return new Symbol(sym.op_mult);}
div {return new Symbol(sym.op_divEntero);}
mod {return new Symbol(sym.op_mod);}
\/ {return new Symbol(sym.op_divReal);}
or {return new Symbol(sym.op_or);}
and {return new Symbol(sym.op_and);}
not	{return new Symbol(sym.op_not);}
\[ {return new Symbol(sym.abrir_corchete);}
\] {return new Symbol(sym.cerrar_corchete);}
\( {return new Symbol(sym.abrir_paren);}
\) {return new Symbol(sym.cerrar_paren);}
\. {return new Symbol(sym.punto);}
\, {return new Symbol(sym.coma);}
\: {return new Symbol(sym.dos_puntos);}
\; {return new Symbol(sym.punto_coma);}
	
[+-]?[0-9]+(\.[0-9]+)?           {return new Symbol(sym.numeric_real_const,yytext());}
[+-]?[0-9A-F]+(\.[0-9A-F]+)?     {return new Symbol(sym.numeric_realHex_const,yytext());}
[+-]?[0-9]+                      {return new Symbol(sym.numeric_integer_const,yytext());}
[+-]?[0-9A-F]+              	 {return new Symbol(sym.numeric_integerHex_const,yytext());}
'[^']*'				 			 {return new Symbol(sym.string_const, yytext());}	
\{[^}]*\} | \(\*[^(\)\*)]*\*\)   {return new Symbol(sym.comentario, yytext());}
[a-zA-Z_]+[a-zA-Z_0-9]*			 {return new Symbol(sym.identifier, yytext());}
\. | \r\n			 			 {;}

/*errorfallback*/