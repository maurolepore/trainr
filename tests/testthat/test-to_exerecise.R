test_that("with a yaml, setup chunk, and empty code chunk: throws no error ", {
  lines <- c(yaml(), setup(), chunk())
  from <- file_path(lines)
  to <- tempfile("exercise", fileext = ".Rmd")

  expect_error_free(to_exercise(from, to))
})

test_that("with a yaml, and setup chunk, but no code chunk: throws no error", {
  lines <- c(yaml(), setup())
  from <- file_path(lines)
  to <- tempfile("exercise", fileext = ".Rmd")

  expect_error_free(to_exercise(from, to))
})

test_that("with a yaml, but not setup or code chunk: throws no error", {
  lines <- c(yaml())
  from <- file_path(lines)
  to <- tempfile("exercise", fileext = ".Rmd")

  expect_error_free(to_exercise(from, to))
})

test_that("with an empty .Rmd file: throws no error", {
  lines <- ""
  from <- file_path(lines)
  to <- tempfile("exercise", fileext = ".Rmd")

  expect_error_free(to_exercise(from, to))
})

test_that("with an empty .Rmd file: outputs the expected exercise header", {
  lines <- ""
  from <- file_path(lines)
  to <- tempfile("exercise", fileext = ".Rmd")

  to_exercise(from, to)
  exercise <- readLines(to)

  expect_equal(exercise, c(get_header(), newline()))
})
