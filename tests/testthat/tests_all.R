context("line_wrap")

test_that("line_wrap return factors right",{
  expect_is(line_wrap(factor(c("first level", "second level")), 7), "factor")
  expect_match(levels(line_wrap(factor(c("first level", "second level")), 7)), "\n")
})

context("palettes")

test_that("Palette returns right number of colours",{
  expect_equal(length(ptt_pal(6)), 6)
})
