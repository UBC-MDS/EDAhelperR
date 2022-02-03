#' Creates histograms for numerical features within a dataframe using ggplot2
#'
#' @param data A dataframe
#' @param columns A list of numerical features for which to create histograms,
#' or by default, plots all numerical features in the dataframe.
#' @param num_bins Integer. Number of bins per histogram plot, default is 30 bins.
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' plot_histogram(iris)
#' plot_histogram(iris, columns = c("Petal.Length", "Petal.Width"), num_bins = 40)
plot_histogram <- function(data, columns = "all", num_bins = 30) {
  # Exception handling
  if (!is.data.frame(data))
    stop("data must be a data frame.")
  if (!is.character(columns))
    stop("columns must be a character vector")
  if (!is.numeric(num_bins))
    stop("num_bins must be a numeric value.")

  # Select columns to plot
  if (columns[1] == "all") {
    plot_data <- data |>
      dplyr::select_if(is.numeric) |>
      tidyr::pivot_longer(dplyr::everything())
  } else {
    plot_data <- data |>
      dplyr::select(dplyr::any_of(columns)) |>
      tidyr::pivot_longer(dplyr::everything())
  }

  # Generate facet plots
  ggplot2::ggplot(plot_data, ggplot2::aes(x = plot_data$value)) +
    ggplot2::geom_histogram(bins = num_bins, fill = "steelblue") +
    ggplot2::facet_wrap(~name, ncol = 3, scales = "free") +
    ggplot2::labs(x = "Value", y = "Count")
}

