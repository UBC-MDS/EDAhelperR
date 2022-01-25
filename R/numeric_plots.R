#' Generate scattered plot matrix of numeric features for EDA
#'
#' @param df A data.frame
#'
#' @return a GGally plot object with the scattered plot matrix of numeric
#'         features.
#' @export
#'
#' @examples
#' numeric_plots(df)
numeric_plots <- function(df){
  if (!is.data.frame(df)) {
    stop("df must be a data.frame.")
  }
  if (nrow(df) == 0){
    stop("df must have at least 1 row.")
  }

  df_numeric <- df |>
    dplyr::select_if(is.numeric)

  if (ncol(df_numeric) < 2){
    stop("df must have at least 2 numeric columns.")
  }

  GGally::ggpairs(df_numeric)
}

