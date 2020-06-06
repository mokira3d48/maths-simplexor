/** Functions definition : */
# define ADDITION		200
# define SUSTRATION		201
# define MULTIPLICATION		202
# define REAL_DIVISION		203
# define VERTICAL_BAR		199


/** Type definition : */
typedef long double 	decimal_t;
typedef long long   	integer_t;
typedef unsigned char	function_t;

/** External variables : */
//extern YYSTYPE yylval;

/** Util function prototype : */
void __show_ans( decimal_t _res_ );
void __show_msg( char* _msg_ );
int  __get( const funtion_t _f_, const int _c_, unsigned _argv_[_c_] );

