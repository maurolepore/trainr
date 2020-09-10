yaml <- function() {
  c(
    "---",
    "output: github_document",
    "---"
  )
}

setup <- function() {
  c(
    "```{r setup, include=FALSE}",
    "knitr::opts_chunk$set(echo = TRUE)",
    "```"
  )
}

chunk <- function(options = "", code = "") {
  c(
    sprintf("```{r%s}", options),
    sprintf("%s", code),
    "```"
  )
}

newline <- function() {
  ""
}

file_path <- function(lines) {
  path <- tempfile()
  writeLines(lines, path)
  path
}

expect_error_free <- function(object) {
  testthat::expect_error(object, regexp = NA)
}
