#' Convert a reproducible 'rmarkdown' document to 'learnr' exercises.
#'
#' @param from Path to read lines from, maybe a URL.
#' @param to Path to write the output into.
#'
#' @return Invisible `from`.
#' @export
#'
#' @examples
#' url <- "https://raw.githubusercontent.com/maurolepore/trainr/master/README.Rmd"
#' # Look before
#' writeLines(readLines(url))
#'
#' path <- tempfile(fileext = ".Rmd")
#' to_exercise(url, path)
#' # Look after
#' writeLines(readLines(path))
#'
#' if (interactive()) rmarkdown::run(path)
to_exercise <- function(from, to) {
  lines <- c(get_header(), get_body(from))
  xfun::write_utf8(lines, to)

  invisible(from)
}

get_yaml <- function(.x) {
  xfun::read_utf8(inst_path("yaml.Rmd"))
}

get_setup <- function() {
  xfun::read_utf8(inst_path("setup.Rmd"))
}

get_header <- function() {
  c(get_yaml(), get_setup())
}

get_body <- function(from) {
  body <- parse_body(from)
  chain_exercise_setup(body)
}

parse_body <- function(url) {
  out <- xfun::read_utf8(url)
  out <- sanitize_chunks(out)
  out <- strip_yaml(out)
  out <- strip_roxygen_note(out)
  out <- strip_setup(out)
  out <- strip_title(out)
  out <- strip_badges(out)
  out <- set_exercise_false_if_eval_false(out)
  out
}

sanitize_chunks <- function(lines) {
  out <- trim_whitespace(lines)
  out <- label_unlabeled(out)
  # out <- add_extra_lines(out)
  out
}

label_unlabeled <- function(lines) {
  out <- lines
  for (i in seq_along(out)) {
    replacement <- sprintf("{r unlabeled-%s\\1}", i)
    pattern <- "\\{[ ]*r([ ]*,.*)\\}|\\{[ ]*r([ ]*)\\}"
    out[i] <- sub(pattern, replacement, out[i])
  }

  out
}

add_extra_lines <- function(out) {
  sub("$", "\n\n\n", out)
}

trim_whitespace <- function(lines) {
  trimed_inside <- sub("```[ ]+\\{", "```{", lines)
  trimws(trimed_inside)
}

set_exercise_false_if_eval_false <- function(lines) {
  sub("eval[.]*=[.]*FALSE", "eval=FALSE, exercise=FALSE", lines)
}

inst_paths <- function() {
  list.files(
    system.file(mustWork = TRUE, package = "trainr"), full.names = TRUE
  )
}

inst_path <- function(path = NULL) {
  if(is.null(path)) {
    system.file(mustWork = TRUE, package = "trainr")
  } else {
    system.file(path, mustWork = TRUE, package = "trainr")
  }
}

`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}
