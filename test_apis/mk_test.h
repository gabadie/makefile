/*
 * C/C++ compatible test API
 */

#ifndef _H_MK_TEST_API
#define _H_MK_TEST_API

#include <stdio.h>

/*
 * @infos: convert a source code to a const char *
 *
 * @param <src>: source code to convert
 */
#define test_str(src) \
    (const char *) #src

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
    printf("- %s (%s@%u)\n", (name), __FILE__, (unsigned int)__LINE__)

/*
 * @infos: print test
 *
 * @param <condition>: test's condition to pass
 */
#define test_assert(condition) \
    { \
        if (condition) \
            test_passed(test_str(condition)); \
        else \
            test_failed(test_str(condition)); \
    }

/*
 * @infos: print test
 *
 * @param <name>: test's name
 * @param <condition>: test's condition to pass
 */
#define test_assert2(name,condition) \
    { \
        if (condition) \
            test_passed(name); \
        else \
            test_failed(name); \
    }


#endif
