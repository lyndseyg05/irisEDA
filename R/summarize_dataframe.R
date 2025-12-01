#' Summarize all columns in a data frame
#'
#' This function applies numeric and categorical summaries to each column in a data frame.
#'
#' @param data A data frame.
#' @return A list with two tibbles: numeric and categorical summaries.
#' @examples
#' summarize_dataframe(iris)
#' @export
summarize_dataframe <- function(data) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  vars_num <- names(data)[vapply(data, is.numeric, logical(1))]
  vars_cat <- names(data)[vapply(data, function(x) is.factor(x) || is.character(x), logical(1))]

  num <- if (length(vars_num)) {
    dplyr::bind_rows(lapply(vars_num, function(v) summarize_numeric(data, v)))
  } else tibble::tibble()

  cat <- if (length(vars_cat)) {
    dplyr::bind_rows(lapply(vars_cat, function(v) summarize_categorical(data, v)))
  } else tibble::tibble()

  out <- list(numeric = num, categorical = cat)
  class(out) <- c("summary_dataframe", class(out))
  out
}
