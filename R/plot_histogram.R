#' Creates histograms for numerical features within a dataframe using ggplot2
#'
#' @param data A dataframe
#' @param columns A list of numerical features for which to create histograms,
#' or by default will plot all numerical features in dataframe.
#' @param num_bins Integer. Number of bins per histogram plot, default is 30 bins.
#'
#' @return ggplot object
#' @export
#'
#' @examples
plot_histogram <- function(data, columns = "all", num_bins = 30) {
  # Exception handling
  if (!is.data.frame(data))
    stop("data must be a data frame.")
  if (!is.vector(columns))
    stop("columns must be a vector of column names within data frame.")
  if (!is.numeric(num_bins))
    stop("num_bins must be a numeric value.")

  # Select columns from data
  if (columns == "all"){
    plot_data <- data |>
      dplyr::select_if(is.numeric)
    columns <- colnames(plot_data)
  } else {
    plot_data <- data |>
      dplyr::select(columns)
  }

  # Generate plots
  plot_list <- list()

  for (i in seq_along(plot_data)) {
    plot_list[[i]] <- ggplot2::ggplot(plot_data, aes(x = columns[i])) +
      geom_histogram(bins = num_bins)
  }
  cowplot::plot_grid(plotlist = plot_list, ncol = 3)
}

