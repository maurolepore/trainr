
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trainr

<!-- badges: start -->

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
url <- "https://raw.githubusercontent.com/maurolepore/trainr/dump-features/README.Rmd"
```

Have a look to this file as is:

```` r
readLines(url)
#>   [1] "---"                                                                                                                                                          
#>   [2] "output: github_document"                                                                                                                                      
#>   [3] "---"                                                                                                                                                          
#>   [4] ""                                                                                                                                                             
#>   [5] "<!-- README.md is generated from README.Rmd. Please edit that file -->"                                                                                       
#>   [6] ""                                                                                                                                                             
#>   [7] "```{r, include = FALSE}"                                                                                                                                      
#>   [8] "knitr::opts_chunk$set("                                                                                                                                       
#>   [9] "  collapse = TRUE,"                                                                                                                                           
#>  [10] "  comment = \"#>\","                                                                                                                                          
#>  [11] "  fig.path = \"man/figures/README-\","                                                                                                                        
#>  [12] "  out.width = \"100%\""                                                                                                                                       
#>  [13] ")"                                                                                                                                                            
#>  [14] "```"                                                                                                                                                          
#>  [15] ""                                                                                                                                                             
#>  [16] "# trainr"                                                                                                                                                     
#>  [17] ""                                                                                                                                                             
#>  [18] "<!-- badges: start -->"                                                                                                                                       
#>  [19] "<!-- badges: end -->"                                                                                                                                         
#>  [20] ""                                                                                                                                                             
#>  [21] "The goal of trainr is to create interactive exercises from static 'rmarkdown' documents."                                                                     
#>  [22] ""                                                                                                                                                             
#>  [23] "Reproducible but static 'rmarkdown' documents abound. For example, many R"                                                                                    
#>  [24] "packages include them in README.Rmd and vignettes. You can transform each"                                                                                    
#>  [25] "'rmarkdown' code chunk into an R console using the learnr exercises"                                                                                          
#>  [26] "(<https://rstudio.github.io/learnr/exercises.html>). But the transformation can"                                                                              
#>  [27] "be tedious (e.g. label unlabeled code chunks and chain exercises setup). This"                                                                                
#>  [28] "package automates the process."                                                                                                                               
#>  [29] ""                                                                                                                                                             
#>  [30] "## Installation"                                                                                                                                              
#>  [31] ""                                                                                                                                                             
#>  [32] "You can install the development version from [GitHub](https://github.com/) with:"                                                                             
#>  [33] ""                                                                                                                                                             
#>  [34] "``` r"                                                                                                                                                        
#>  [35] "# install.packages(\"devtools\")"                                                                                                                             
#>  [36] "devtools::install_github(\"maurolepore/trainr\")"                                                                                                             
#>  [37] "```"                                                                                                                                                          
#>  [38] "## Example"                                                                                                                                                   
#>  [39] ""                                                                                                                                                             
#>  [40] "```{r example}"                                                                                                                                               
#>  [41] "library(trainr)"                                                                                                                                              
#>  [42] "```"                                                                                                                                                          
#>  [43] ""                                                                                                                                                             
#>  [44] "Transform the static README.Rmd of this package into an interactive 'learnr' tutorial, where each executable code chunk is an exercises -- i.e. an R console."
#>  [45] ""                                                                                                                                                             
#>  [46] "```{r}"                                                                                                                                                       
#>  [47] "url <- \"https://raw.githubusercontent.com/maurolepore/trainr/dump-features/README.Rmd\""                                                                     
#>  [48] "```"                                                                                                                                                          
#>  [49] ""                                                                                                                                                             
#>  [50] "Have a look to this file as is:"                                                                                                                              
#>  [51] ""                                                                                                                                                             
#>  [52] "```{r, results='asis'}"                                                                                                                                       
#>  [53] "writeLines(head(readLines(url), 20))"                                                                                                                         
#>  [54] "```"                                                                                                                                                          
#>  [55] ""                                                                                                                                                             
#>  [56] "Convert each executable chunk to an 'learnr' exercise."                                                                                                       
#>  [57] ""                                                                                                                                                             
#>  [58] "```{r}"                                                                                                                                                       
#>  [59] "path <- tempfile(fileext = \".Rmd\")"                                                                                                                         
#>  [60] "write_tutorial(url, path)"                                                                                                                                    
#>  [61] "```"                                                                                                                                                          
#>  [62] ""                                                                                                                                                             
#>  [63] "Have a look to this file after the transformation."                                                                                                           
#>  [64] ""                                                                                                                                                             
#>  [65] "```{r, results='asis'}"                                                                                                                                       
#>  [66] "writeLines(head(readLines(path), 20))"                                                                                                                        
#>  [67] "```"                                                                                                                                                          
#>  [68] ""                                                                                                                                                             
#>  [69] "Play."                                                                                                                                                        
#>  [70] ""                                                                                                                                                             
#>  [71] "```{r}"                                                                                                                                                       
#>  [72] "if (interactive()) {"                                                                                                                                         
#>  [73] "  rmarkdown::run(path)"                                                                                                                                       
#>  [74] "}"                                                                                                                                                            
#>  [75] "```"                                                                                                                                                          
#>  [76] ""                                                                                                                                                             
#>  [77] ""                                                                                                                                                             
#>  [78] "Code that prints anything to the console should be at the end of any one chunk."                                                                              
#>  [79] ""                                                                                                                                                             
#>  [80] "* Good:"                                                                                                                                                      
#>  [81] ""                                                                                                                                                             
#>  [82] "```{r}"                                                                                                                                                       
#>  [83] "x <- 1"                                                                                                                                                       
#>  [84] "message(\"Good: Output something to the console at the end of the code chunk\")"                                                                              
#>  [85] "```"                                                                                                                                                          
#>  [86] ""                                                                                                                                                             
#>  [87] "* Bad:"                                                                                                                                                       
#>  [88] ""                                                                                                                                                             
#>  [89] "```{r}"                                                                                                                                                       
#>  [90] "message(\"Bad: Output something to the console before the end of the code chunk\")"                                                                           
#>  [91] "x <- 1"                                                                                                                                                       
#>  [92] "```"                                                                                                                                                          
#>  [93] ""                                                                                                                                                             
#>  [94] "* Also bad:"                                                                                                                                                  
#>  [95] ""                                                                                                                                                             
#>  [96] "```{r}"                                                                                                                                                       
#>  [97] "x <- 1"                                                                                                                                                       
#>  [98] "# Bad: Output something to the console before the end of the code chunk"                                                                                      
#>  [99] "x"                                                                                                                                                            
#> [100] "y <- 2"                                                                                                                                                       
#> [101] "```"                                                                                                                                                          
#> [102] ""
````

Convert each executable chunk to an ‘learnr’ exercise.

``` r
path <- tempfile(fileext = ".Rmd")
write_tutorial(url, path)
```

Have a look to this file after the transformation.

```` r
readLines(path)
#>   [1] "---"                                                                                                                                                          
#>   [2] "title: \"Turorial\""                                                                                                                                          
#>   [3] "output: "                                                                                                                                                     
#>   [4] "  learnr::tutorial:"                                                                                                                                          
#>   [5] "    progressive: true"                                                                                                                                        
#>   [6] "    allow_skip: true"                                                                                                                                         
#>   [7] "    df_print: default"                                                                                                                                        
#>   [8] "runtime: shiny_prerendered"                                                                                                                                   
#>   [9] "---"                                                                                                                                                          
#>  [10] ""                                                                                                                                                             
#>  [11] ""                                                                                                                                                             
#>  [12] "```{r setup, include=FALSE}"                                                                                                                                  
#>  [13] "library(learnr)"                                                                                                                                              
#>  [14] ""                                                                                                                                                             
#>  [15] "tutorial_options("                                                                                                                                            
#>  [16] "  exercise.timelimit = 60,"                                                                                                                                   
#>  [17] "  exercise.eval = TRUE"                                                                                                                                       
#>  [18] ")"                                                                                                                                                            
#>  [19] ""                                                                                                                                                             
#>  [20] "# Any chunk should output noting or only one thing at the end. Otput mid-chunk"                                                                               
#>  [21] "# interferes with the code unter it"                                                                                                                          
#>  [22] "knitr::opts_chunk$set("                                                                                                                                       
#>  [23] "  echo = FALSE,"                                                                                                                                              
#>  [24] "  # Can't be set in tutorial_options()"                                                                                                                       
#>  [25] "  exercise = TRUE,"                                                                                                                                           
#>  [26] "  # Problematic arguments: If not set this way, output breaks code"                                                                                           
#>  [27] "  results = \"hold\","                                                                                                                                        
#>  [28] "  collapse = FALSE,"                                                                                                                                          
#>  [29] "  error = FALSE,"                                                                                                                                             
#>  [30] "  warning = FALSE,"                                                                                                                                           
#>  [31] "  message = FALSE"                                                                                                                                            
#>  [32] ")"                                                                                                                                                            
#>  [33] "```"                                                                                                                                                          
#>  [34] ""                                                                                                                                                             
#>  [35] ""                                                                                                                                                             
#>  [36] ""                                                                                                                                                             
#>  [37] ""                                                                                                                                                             
#>  [38] ""                                                                                                                                                             
#>  [39] ""                                                                                                                                                             
#>  [40] "# trainr"                                                                                                                                                     
#>  [41] ""                                                                                                                                                             
#>  [42] ""                                                                                                                                                             
#>  [43] "The goal of trainr is to create interactive exercises from static 'rmarkdown' documents."                                                                     
#>  [44] ""                                                                                                                                                             
#>  [45] "Reproducible but static 'rmarkdown' documents abound. For example, many R"                                                                                    
#>  [46] "packages include them in README.Rmd and vignettes. You can transform each"                                                                                    
#>  [47] "'rmarkdown' code chunk into an R console using the learnr exercises"                                                                                          
#>  [48] "(<https://rstudio.github.io/learnr/exercises.html>). But the transformation can"                                                                              
#>  [49] "be tedious (e.g. label unlabeled code chunks and chain exercises setup). This"                                                                                
#>  [50] "package automates the process."                                                                                                                               
#>  [51] ""                                                                                                                                                             
#>  [52] "## Installation"                                                                                                                                              
#>  [53] ""                                                                                                                                                             
#>  [54] "You can install the development version from [GitHub](https://github.com/) with:"                                                                             
#>  [55] ""                                                                                                                                                             
#>  [56] "``` r"                                                                                                                                                        
#>  [57] "# install.packages(\"devtools\")"                                                                                                                             
#>  [58] "devtools::install_github(\"maurolepore/trainr\")"                                                                                                             
#>  [59] "```"                                                                                                                                                          
#>  [60] "## Example"                                                                                                                                                   
#>  [61] ""                                                                                                                                                             
#>  [62] "```{r example, exercise.setup='setup'}"                                                                                                                       
#>  [63] "library(trainr)"                                                                                                                                              
#>  [64] "```"                                                                                                                                                          
#>  [65] ""                                                                                                                                                             
#>  [66] "Transform the static README.Rmd of this package into an interactive 'learnr' tutorial, where each executable code chunk is an exercises -- i.e. an R console."
#>  [67] ""                                                                                                                                                             
#>  [68] "```{r unlabeled-46, exercise.setup='example'}"                                                                                                                
#>  [69] "url <- \"https://raw.githubusercontent.com/maurolepore/trainr/dump-features/README.Rmd\""                                                                     
#>  [70] "```"                                                                                                                                                          
#>  [71] ""                                                                                                                                                             
#>  [72] "Have a look to this file as is:"                                                                                                                              
#>  [73] ""                                                                                                                                                             
#>  [74] "```{r unlabeled-52, results='asis', exercise.setup='unlabeled-46'}"                                                                                           
#>  [75] "writeLines(head(readLines(url), 20))"                                                                                                                         
#>  [76] "```"                                                                                                                                                          
#>  [77] ""                                                                                                                                                             
#>  [78] "Convert each executable chunk to an 'learnr' exercise."                                                                                                       
#>  [79] ""                                                                                                                                                             
#>  [80] "```{r unlabeled-58, exercise.setup='unlabeled-52'}"                                                                                                           
#>  [81] "path <- tempfile(fileext = \".Rmd\")"                                                                                                                         
#>  [82] "write_tutorial(url, path)"                                                                                                                                    
#>  [83] "```"                                                                                                                                                          
#>  [84] ""                                                                                                                                                             
#>  [85] "Have a look to this file after the transformation."                                                                                                           
#>  [86] ""                                                                                                                                                             
#>  [87] "```{r unlabeled-65, results='asis', exercise.setup='unlabeled-58'}"                                                                                           
#>  [88] "writeLines(head(readLines(path), 20))"                                                                                                                        
#>  [89] "```"                                                                                                                                                          
#>  [90] ""                                                                                                                                                             
#>  [91] "Play."                                                                                                                                                        
#>  [92] ""                                                                                                                                                             
#>  [93] "```{r unlabeled-71, exercise.setup='unlabeled-65'}"                                                                                                           
#>  [94] "if (interactive()) {"                                                                                                                                         
#>  [95] "rmarkdown::run(path)"                                                                                                                                         
#>  [96] "}"                                                                                                                                                            
#>  [97] "```"                                                                                                                                                          
#>  [98] ""                                                                                                                                                             
#>  [99] ""                                                                                                                                                             
#> [100] "Code that prints anything to the console should be at the end of any one chunk."                                                                              
#> [101] ""                                                                                                                                                             
#> [102] "* Good:"                                                                                                                                                      
#> [103] ""                                                                                                                                                             
#> [104] "```{r unlabeled-82, exercise.setup='unlabeled-71'}"                                                                                                           
#> [105] "x <- 1"                                                                                                                                                       
#> [106] "message(\"Good: Output something to the console at the end of the code chunk\")"                                                                              
#> [107] "```"                                                                                                                                                          
#> [108] ""                                                                                                                                                             
#> [109] "* Bad:"                                                                                                                                                       
#> [110] ""                                                                                                                                                             
#> [111] "```{r unlabeled-89, exercise.setup='unlabeled-82'}"                                                                                                           
#> [112] "message(\"Bad: Output something to the console before the end of the code chunk\")"                                                                           
#> [113] "x <- 1"                                                                                                                                                       
#> [114] "```"                                                                                                                                                          
#> [115] ""                                                                                                                                                             
#> [116] "* Also bad:"                                                                                                                                                  
#> [117] ""                                                                                                                                                             
#> [118] "```{r unlabeled-96, exercise.setup='unlabeled-89'}"                                                                                                           
#> [119] "x <- 1"                                                                                                                                                       
#> [120] "# Bad: Output something to the console before the end of the code chunk"                                                                                      
#> [121] "x"                                                                                                                                                            
#> [122] "y <- 2"                                                                                                                                                       
#> [123] "```"                                                                                                                                                          
#> [124] ""
````

Play.

``` r
if (interactive()) {
  rmarkdown::run(path)
}
```

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

  - Also bad:

<!-- end list -->

``` r
x <- 1
# Bad: Output something to the console before the end of the code chunk
x
#> [1] 1
y <- 2
```
