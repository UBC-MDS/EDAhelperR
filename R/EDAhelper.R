#' Preprocess data in txt, csv, Excel, etc. by dealing with missing values in numeric columns.
#'
#' @param path string, path of data file.
#' @param method `c(NULL, 'most_frequent', 'mean', 'median', 'constant')`,  default=`NULL`
#' 
#' The imputation method.
#' 
#' If `NULL`, then missing values are treated as NaN.
#' 
#' If 'mean', then replace missing values using the mean along each column.
#' 
#' If 'median', then replace missing values using the median along each column.
#' 
#' If 'most_frequent', then replace missing using the most frequent value along each column. If there is more than one such value, only the smallest is returned.
#' 
#' If 'constant', then replace missing values with fill_value.
#' @param fill_value `NULL` or numeric_value, default=`NULL`
#' 
#' When method='constant', fill_value is used to replace all occurrences of missing values. 
#' If left to the default, fill_value will be 0 when imputing numerical data.
#' @param read_func `readr::read_*` function name, default=`readr::read_csv`
#' @param ... Any keyword arguments are defined in read_func
#'
#' @return a tibble
#' @export
#'
#' @examples
#' preprocess(readr::readr_example("mtcars.csv"))

preprocess <- function(path, method=NULL, fill_value=NULL, read_func=readr::read_csv, ...){
  print('This is preprocess func')
}


