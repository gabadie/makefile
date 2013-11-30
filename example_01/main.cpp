
#include "main.h"


int
main()
{
    printf("hello world\n");

    cl_uint platformIdCount = 0;
    clGetPlatformIDs(0, 0, &platformIdCount);

    return 0;
}

