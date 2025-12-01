test_that("summarize_numeric works on iris", {
  res <- summarize_numeric(iris, "Sepal.Length")
  expect_s3_class(res, "summary_numeric")
  expect_true(res$n > 0)
})

test_that("summarize_categorical works on iris", {
  res <- summarize_categorical(iris, "Species")
  expect_s3_class(res, "summary_categorical")
  expect_equal(sum(res$prop), 1)
})

test_that("summarize_dataframe returns both components", {
  res <- summarize_dataframe(iris)
  expect_s3_class(res, "summary_dataframe")
  expect_true(is.data.frame(res$numeric))
  expect_true(is.data.frame(res$categorical))
})
