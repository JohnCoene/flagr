
[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/flagr.svg?branch=master)](https://travis-ci.org/JohnCoene/flagr)![Coverage Status](https://img.shields.io/coveralls/JohnCoene/flagr.svg)![Coverage](https://img.shields.io/codecov/c/github/JohnCoene/flagr/master.svg)

flagr
=====

[flag-icons](https://github.com/lipis/flag-icon-css) for R

Installation
------------

You can install flagr from github with:

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/flagr")
```

Example
-------

``` r
library(flagr)

flagr("be") # belgian flag
flagr("gr") # greek flag
flagr("us", width = 100, height = 60) # us flag
flagr("ch", squared = TRUE) # swiss flag squared
```

FYI
---

Flag icons are SVG, leading to large `/inst` directory.

``` 
R CMD check results
0 errors | 0 warnings | 1 note 
checking installed package size ... NOTE
  installed size is  7.9Mb
  sub-directories of 1Mb or more:
    htmlwidgets   7.8Mb
```
