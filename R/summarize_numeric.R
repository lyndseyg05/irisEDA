#' Summarize numeric variables
#'
#' This function calculates summary statistics for a numeric column in a data frame.
#'
#' @param data A data frame.
#' @param var A column name (string) referring to a numeric variable.
#' @return A tibble with summary statistics.
#' @examples
#' summarize_numeric(iris, "Sepal.Length")
#' @export
summarize_numeric <- function(data, var) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.character(var) || length(var) != 1) stop("`var` must be a single string.")
  if (!var %in% names(data)) stop("`var` must be a column in `data`.")
  x <- data[[var]]
  if (!is.numeric(x)) stop("`var` must be numeric.")

  res <- tibble::tibble(
    variable = var,
    n = sum(!is.na(x)),
    n_missing = sum(is.na(x)),
    mean = mean(x, na.rm = TRUE),
    median = stats::median(x, na.rm = TRUE),
    sd = stats::sd(x, na.rm = TRUE),
    min = min(x, na.rm = TRUE),
    q25 = stats::quantile(x, 0.25, na.rm = TRUE, names = FALSE),
    q75 = stats::quantile(x, 0.75, na.rm = TRUE, names = FALSE),
    max = max(x, na.rm = TRUE)
  )
  class(res) <- c("summary_numeric", class(res))
  res
}
