# dbTopmedHelper

Helper functions for interacting with the database `topmed_pheno`. Currently, additional helper functions for phenotype harmonization are maintained in the [harmonHelper](https://github.com/UW-GAC/harmonHelper) package.

## Installation instructions

Currently, this package is not installed to the GAC shared library. Use the `withr` and `devtools` packages to install it to your personal library

```
library(withr)
library(devtools)
install_loc <- "/path/to/your/library"
withr::with_libpaths(new = install_loc, 
    devtools::install_github("UW-GAC/dbTopmedHelper"))
```
