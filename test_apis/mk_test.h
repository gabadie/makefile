/*
 * C/C++ compatible test API
 */

#ifndef _H_MK_TEST_API
#define _H_MK_TEST_API

#include <stdio.h>

/*
 * @infos: outputs that the test has succed
 *
 * @param <name>: test's name
 */
#define test_passed(name) \
    printf("+ %s\n", (name))

/*
 * @infos: outputs that the test has failed
 *
 * @param <name>: test's name
 */
#define test_failed(name) \
    printf("- %s\n", (name))

/*
 * @infos: print test
 *
 * @param <name>: test's name
 * @param <condition>: test's condition to pass
 */
#define test_condition(name,condition) \
    { \
        if (condition) \
            test_passed(name); \
        else \
            test_failed(name); \
    }


#endif
