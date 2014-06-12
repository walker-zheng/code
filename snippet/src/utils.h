/* @(#)utils.h
*/

#ifndef _UTILS_H
#define _UTILS_H 1

#include <stdarg.h>
#include <stdio.h>
#include <iostream>


// Macros - exit in any error (eval < 0) case
#define CHK(eval) if(eval < 0){perror("eval"); exit(-1);}

// Macros - same as above, but save the result(res) of expression(eval)
#define CHK2(res, eval) if((res = eval) < 0){perror("eval"); exit(-1);}

//  Debug print
#ifdef DEBUG
#define DEBUG_PRINT(...) do{ fprintf( stderr, __VA_ARGS__ ); } while( false )
#else
#define DEBUG_PRINT(...) do{ } while ( false )
#endif

#define debug_print(fmt, ...) \
        do { if (DEBUG) fprintf(stderr, "%s:%d:%s(): " fmt, __FILE__, \
                __LINE__, __func__, __VA_ARGS__); \
        } while (0)

#define DBGVAR( os, var ) \
        (os) << "DBG: " << __FILE__ << "(" << __LINE__ << ") "\
                << #var << " = [" << (var) << "]" << std::endl
#define DBGMSG( os, msg ) \
        (os) << "DBG: " << __FILE__ << ":" << __LINE__ << ": " \
                << msg << std::endl



#endif /* _UTILS_H */
