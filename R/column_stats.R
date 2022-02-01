#' Obtain summary statistics of column(s) including count, mean, median, mode, Q1, Q3,
#'variance, standard deviation, correlation, and covariance in table format.
#' Parameters
#' -------------
#' @param data A data set from which columns will be selected
#' @param columns A list of columns for which to obtain summary stats, correlation matrix, and covariance matrix
#'           (if > 1 column arguments used)
#' @return three pd.DataFrames
#' @export
#'
#' @examples
#' column_stats(iris, c('Sepal.Length', 'Sepal.Width', 'Petal.Length'))

column_stats <- function(data, columns){
    if (!is.data.frame(data)) {
        stop("First input must be a data.frame.")
        }
    if (!is.vector(columns) && !is.atomic(columns)) {
          stop("Columns argument should be a vector")
        }

    summary_stats <- c()
    for (column in columns){
        new_row <- c(NROW(data[[column]]),
                     round(mean(data[[column]], na.rm = TRUE), 3),
                     stats::median(data[[column]]),
                     statip::mfv(data[[column]]),
                     stats::quantile(data[[column]], 0.25),
                     stats::quantile(data[[column]], 0.75),
                     round(stats::var(data[[column]], na.rm = TRUE), 3),
                     stats::sd(data[[column]], na.rm = TRUE))
        summary_stats <- rbind(summary_stats, new_row)
        }
    rownames(summary_stats) <- columns
    colnames(summary_stats) <- c('Count', 'Mean', 'Median', 'Mode', 'Q1', 'Q3', 'Var', 'Stdev')

    covmatrix <- stats::cov(data |> dplyr::select(tidyselect::all_of(columns)))

    corrmatrix <- stats::cor(data |> dplyr::select(tidyselect::all_of(columns)))
    return(list(summary_stats, covmatrix, corrmatrix))
}
