library(testthat)
library(flagr)

test_that("test all", {
  p <- flagr("gr")

  expect_equal(p$x$flag, "gr")
  expect_false(p$x$squared)

  s <- flagr("gr", squared = TRUE)
  expect_true(s$x$squared)

  expect_error(flagr())
})
