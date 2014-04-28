
Guillaume Abadie's makefile solution

@parameters:
    - config=CONFIG_NAME
        specify the CONFIG_NAME.mk configuration file in the
        project's directory. By default, config's value is:
        default

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

    > make test
    > make tests
    > make test/update
        Updates tests

    > make test/clean
        Cleans tests' logs

    > make test/full
        Forces all tests

    > hook
    > hook/precommit
        Executes pre-commit hook

    > make travis/setup
        Creates Travis CI (travis-ci.org) configuration file (.travis.yml)
