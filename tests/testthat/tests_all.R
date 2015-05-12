context("line_wrap")

test_that("line_wrap return factors right",{
  skip_on_cran()
  expect_is(line_wrap(factor(c("first level", "second level")), 7), "factor")
  expect_match(levels(line_wrap(factor(c("first level", "second level")), 7)), "\n")
})
