#include <stdlib.h>
#include <string.h>
//#include "libft"

int parse_double(char* representation, double* value);
 
int parse_double(char* representation, double* value)
{
    char*   safe;

    safe = NULL;
    *value = strtod(representation, &safe);
    if (safe == (representation + strlen(representation)))
    {
        return (1);
    }
    else
    {
        return (0);
    }
}
