
Guillaume Abadie's makefile solution

@glossary:
    - configuration file:
        A configuration file is a makefile automatiqually called
        in the project directory, and it defines all project's
        products.

    - main makefile:
        The main makefile is the makefile in the project directory
        that include build.mk. Therefore, its content is as easy as
        that:

            include /path/to/a/clone/of/this/repository/build.mk

    - makefile repository:
        See repository.

    - product:
        A product is what you want to create : static library,
        application... You can create severals products in one
        project.

    - project:
        A project is a set of product. A project has only one
        project diretory where the main makefile is, and can have
        severals project configuration files.

    - project configuration file:
        The project configuration file is the file automatically
        included and defines all project's product. A project
        can have severals configuration files, but only one can be
        used at a time with the repository parameter <config>
        to load <config>.mk in the project directory.

    - project directory:
        The project directory is where the main makefile is. It also
        contain the makefile repository and all configuration files.

    - repository (or makefile repository):
        Each project directory can have a makefile repository.
        It contains all repository parameters that can be set one
        time, and uses by default after.

    - respository parameters:
        A given repository parameter <param> is a parameter that
        can be saved in the makefile repository

        example:
            > make update config=release
            > make test/all config=release

            is equivalent as:
            > make param/set config=release
            > make update
            > make test/all

@parameters:
    - message_indent=STRING
        string inserted at the begining of all message line

@repository parameters:
    - config=CONFIG_NAME
        specify the CONFIG_NAME.mk configuration file in the
        project's directory. By default, config's value is:
        default

    - cc=COMPILOR
        specify the C compilor (gcc, gcc-<version>, clang ...)
        default: gcc -c -x c

    - cxx=COMPILOR
        specify the C++ compilor (g++, g++-<version>, clang++ ...)
        default: g++ -c -x c++

    - cxxheaders=COMPILOR
        specify the C++ headers compilor (g++, g++-<version>, clang++ ...)
        default: g++ -x c++-header

    - ld=LINKER
        specify the linker (g++, g++-<version>, clang++ ...)
        default: g++

@project configuration file:
    Copy ./config_template.mk in your project directory and then
    edit it as you wish.

@user commands:
    > make
    > make build
    > make build/update
        Updates public products' targets

    > make build/full
        Forces compilation from scratch

    > make build/full/rec
        Recursively forces compilation from scratch

    > make build/product/<product_name>
        Updates a product's target

    > make clean
        Prunes the build directory content (execept for the logs dir,
        product's target dir and the clobber mirror file)

    > make trash
        Removes the build directory

    > make clobber
        Clobber all targets of all configurations

    > make stats
        Prints statistiques per kinds of file

    > make show/products
        Shows public products

    > make show/products/all
        Shows all (public and private) products

    > make show/targets
        Shows public products' targets

    > make show/targets/all
        Shows all (public and private) products' targets

    > make product/<product_name>/type
        Gets the product's type

    > make product/<product_name>/target
        Gets the product's target

    > make run/all
        Updates and runs alls executable products

    > make run/product/<product_name>
        Updates and runs a specific product

    > make open/all
        Updates and opens alls openable products

    > make open/product/<product_name>
        Updates and opens a specific product

    > make tests
    > make test/update
        Updates tests

    > make test/full
        Forces all tests

    > make test/product/<product_name>
        Forces test execution for a specific product

    > hook/precommit
        Executes pre-commit hook

    > make param/set
        Saves modified repository parameters

    > make param/show
        Shows all repository parameters in ./.mkrepo

    > make param/repo
        Shows the makefile repository path

