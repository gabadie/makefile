
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
    > make clean ; make
        Force compilation from scratch

    > make set
        Saves modified variable into the project

