%{

# include <stdlib.h>
# include <stdio.h>
# include "msx.h"

extern int yylex();
int yyerror( char* msg );

void __show_ans( decimal_t _res_ );
void __show_msg( char* _msg_ );
int  __get( const funtion_t _f_, const int _c_, unsigned _argv_[_c_] );

%}

%union {
	integer_t  intval;
	decimal_t  decval;
	function_t funct;
}

%token INTVAL			// valeur entière
%token REALVAL			// valeur réelle			
%token PLUS			// +
%token LESS			// -
%token CROSS			// x
%token SLASH			// /
%token NEGATIVE			// -x
%token FUNCTION			// function
%token ENDLINE			// \n


/** Configuration des priorités : [Moins prioritaire -> Plus prioritaire] */
%left PLUS	LESS
%left CROSS	SLASH
%left FUNCTION
%right NEGATIVE

%start Operation

%%

Input :
  	| Input Operation
	;

Operation :
	  ENDLINE 			{ __show_ans( 0.0l ); }
	| Expression ENDLINE		{ __show_ans( $1 ); }
	| error ENDLINE			{ __show_msg( "[SYNTAX ERROR]\t\t Erreur de saisie !! " ); }
	;

Expression :
	  REALVAL			{ $$ = $1; }
	| INTVAL			{ $$ = $2; }
	| Expression PLUS Expression	{ $$ = get( ADDITION, {$1, $3} ); }
