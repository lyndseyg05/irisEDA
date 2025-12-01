#' Plot summaries for a dataframe
#'
#' Creates histograms for numeric variables and bar charts for categorical variables.
#'
#' @param data A data frame.
#' @return A list of ggplot objects, one per variable.
#' @export
#' @examples
#' plot_dataframe(iris)
plot_dataframe <- function(data) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required. Please install it.")
  }

  plots <- list()

  for (var in names(data)) {
    if (is.numeric(data[[var]])) {
      p <- ggplot2::ggplot(data, ggplot2::aes_string(var)) +
        ggplot2::geom_histogram(fill = "pink", color = "white", bins = 30) +
        ggplot2::theme_minimal() +
        ggplot2::labs(title = paste("Distribution of", var))
      plots[[var]] <- p
    } else {
      p <- ggplot2::ggplot(data, ggplot2::aes_string(var)) +
        ggplot2::geom_bar(fill = "darkgreen") +
        ggplot2::theme_minimal() +
        ggplot2::labs(title = paste("Counts of", var))
      plots[[var]] <- p
    }
  }

  return(plots)
}
