
Guillaume Abadie's makefile solution

@parameters:
    - config=CONFIG_NAME
        specify the CONFIG_NAME.mk configuration file in the
        project's directory

@common commands:
    > make
    > make update
        Updates targets

    > make clean
        Cleans targets

    > make full
        Forces compilation from scratch

    > make full/rec
        Recursively forces compilation from scratch

    > make run/all
        Updates and runs alls executable products

    > make run/product/<product_name>
        Updates and runs a specific product

    > make tests
    > make test/update
        Updates tests

    > make test/full
        Forces all tests

    > make test/product/<product_name>
        Forces test execution for a specific product

    > make set
        Saves modified variable into the ./mkrepo

    > make params
        Shows all parameters in ./.mkrepo

