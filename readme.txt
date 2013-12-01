
Guillaume Abadie's makefile solution

@parameters:
    - message_indent=STRING
        string inserted at the begining of all message line

@repo parameters:
    A repo's parameter named <param> is a parameter that can
    be saved in the file ./.mkrepo/<param>

    the evaluation of a suck kind of parameter is done like that:
        - uses the one defined in the command line
        - else if difined in the repository: use it
        - else uses a default value

    - config=CONFIG_NAME
        specify the CONFIG_NAME.mk configuration file in the
        project's directory. By default, config's value is:
        default

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
        Saves modified parameters into the ./.mkrepo

    > make params
        Shows all parameters in ./.mkrepo

