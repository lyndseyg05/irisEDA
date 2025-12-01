test_that("plot_dataframe returns plots", {
  res <- plot_dataframe(iris)
  expect_true(is.list(res))
  expect_true(all(sapply(res, inherits, "ggplot")))
})
