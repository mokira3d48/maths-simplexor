%option noyywrap

%{

# include <stdlib.h>
# include <stdio.h>

# include "msx.h"
# include "msx.tab.h"

%}

space		[ \t]+
number		[0-9]
integer		{number}+
real		{integer}"."{integer}
sreal		{real}"E""-"?{integer}

%%



%%
