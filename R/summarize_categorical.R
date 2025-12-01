#' Summarize categorical variables
#'
#' This function calculates counts and proportions for a categorical column in a data frame.
#'
#' @param data A data frame.
#' @param var A column name (string) referring to a categorical variable.
#' @return A tibble with counts and proportions.
#' @examples
#' summarize_categorical(iris, "Species")
#' @export
summarize_categorical <- function(data, var) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.character(var) || length(var) != 1) stop("`var` must be a single string.")
  if (!var %in% names(data)) stop("`var` must be a column in `data`.")
  x <- data[[var]]
  if (!(is.factor(x) || is.character(x))) stop("`var` must be categorical (factor or character).")

  tib <- tibble::tibble(value = x)
  res <- dplyr::count(tib, value, name = "n")
  res <- dplyr::mutate(res,
                       variable = var,
                       prop = n / sum(n),
                       .after = n
  )
  res <- dplyr::select(res, variable, value, n, prop)
  class(res) <- c("summary_categorical", class(res))
  res
}
