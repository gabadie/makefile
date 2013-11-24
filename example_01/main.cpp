
#include <stdio.h>

#ifdef __APPLE__
    #include "OpenCL/opencl.h"
#else
    #include "CL/cl.h"
#endif


int
main()
{
    printf("hello world");

    cl_uint platformIdCount = 0;
    clGetPlatformIDs(0, 0, &platformIdCount);

    return 0;
}

