#' @export
print.summary_numeric <- function(x, ...) {
  knitr::kable(x, format = "simple")
}

#' @export
print.summary_categorical <- function(x, ...) {
  knitr::kable(x, format = "simple", digits = 3)
}

#' @export
print.summary_dataframe <- function(x, ...) {
  cat("Numeric summaries:\n")
  if (nrow(x$numeric) == 0) {
    cat("(none)\n")
  } else {
    print(knitr::kable(x$numeric, format = "simple"))
  }
  cat("\nCategorical summaries:\n")
  if (nrow(x$categorical) == 0) {
    cat("(none)\n")
  } else {
    print(knitr::kable(x$categorical, format = "simple", digits = 3))
  }
  invisible(x)
}
