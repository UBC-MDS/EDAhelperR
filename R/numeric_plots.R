#' Generate scattered plot matrix of numeric features for EDA
#'
#' @param df A data.frame
#'
#' @return a GGally plot object with the scattered plot matrix of numeric
#'         features.
#' @export
#'
#' @examples
#' df <- data.frame(names=c("Vera", "Jennifer", "Rowan", "Steven"),
#'   scores =c(90, 80, 70, 80),
#'   age=c(12, 23, 20, 100))
#'
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

