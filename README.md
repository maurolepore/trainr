
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trainr

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/trainr)](https://CRAN.R-project.org/package=trainr)
<!-- badges: end -->

The goal of trainr is to create interactive exercises from static
‘rmarkdown’ documents.

Reproducible but static ‘rmarkdown’ documents abound. For example, many
R packages include them in README.Rmd and vignettes. You can transform
each ‘rmarkdown’ code chunk into an R console using the learnr exercises
(<https://rstudio.github.io/learnr/exercises.html>). But the
transformation can be tedious (e.g. label unlabeled code chunks and
chain exercises setup). This package automates the process.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("maurolepore/trainr")
```

## Example

``` r
library(trainr)
```

Transform the static README.Rmd of this package into an interactive
‘learnr’ tutorial, where each executable code chunk is an exercises –
i.e. an R console.

``` r
url <- "https://raw.githubusercontent.com/maurolepore/trainr/master/README.Rmd"
```

Have a look to this file as is:

``` r
writeLines(head(readLines(url), 10))
```

    ---
    output: github_document
    ---
    
    <!-- README.md is generated from README.Rmd. Please edit that file -->
    
    ```{r setup, include = FALSE}
    knitr::opts_chunk$set(
      collapse = TRUE,
      comment = "#>",

Convert each executable chunk to an ‘learnr’ exercise.

``` r
path <- tempfile("exercise", fileext = ".Rmd")
to_exercise(url, path)
```

Have a look to this file after the transformation.

``` r
writeLines(head(readLines(path), 10))
---
title: "Turorial"
output: 
  learnr::tutorial:
    progressive: true
    allow_skip: true
    df_print: default
runtime: shiny_prerendered
---
```

Enjoy\!

``` r
rmarkdown::run(path)
```

## Avoid problems

Code that prints anything to the console should be at the end of any one
chunk.

  - Good:

<!-- end list -->

``` r
x <- 1
message("Good: Output something to the console at the end of the code chunk")
#> Good: Output something to the console at the end of the code chunk
```

  - Bad:

<!-- end list -->

``` r
message("Bad: Output something to the console before the end of the code chunk")
#> Bad: Output something to the console before the end of the code chunk
x <- 1
```
