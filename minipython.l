%{

#include <iostream>
#include <string>
#include <vector>
#include <cstdio>
#include <cstdlib>
#include "DataStructure.h"
#include "minipy.tab.h"
#define YYSTYPE U
extern U yylval;
extern "C"
{

#include <stdio.h>
#include <stdlib.h>

    int yylex();
}

using namespace std;



%}

letter    [a-zA-Z]

digit     [0-9]

number   {digit}+

id       {letter}({letter}|{digit})*

real     {number}\.{number}?|{number}?\.{number}

%%
[ \t]+      {/*do nothing , just skip */}
{number}    { 
                yylval.val_int = atoi(yytext);
                yylval.val_type = INT;
                return INT;
              
            }
{real}      {
                yylval.val_float = atof(yytext);
                yylval.val_type = REAL;
                return REAL;
            }
{id}        {
                yylval.s = yytext;
                yylval.val_type = VAR;
                return ID; 
            }
\"(\\.|[^\\"])*\"   {
                        yylval.val_str = yytext;
                        yylval.val_type = STR;
                        return STRING_LITERAL; 
                    }
.|\n        {
                 return yylval.val_int = yytext[0];
            }
%%