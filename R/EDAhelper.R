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
  if (!is.character(path)) stop('Err msg: wrong path input')
  if (!is.null(method)){
    if (method == 'constant'){
      if (!is.null(fill_value)){
        if (!is.numeric(fill_value)){
          stop("Err msg: wrong fill_value input when method = 'constant'")
        }
      }
    }else if (!(method %in% c('mean', 'median', 'most_frequent'))){
      stop('Err msg: wrong method input')
    }
  }


  out <- tryCatch({read_func(path, ...)},
                  error = function(cond) {
                    stop(message(cond))
                  }
                  )

  if (is.null(method)) return(out)

  out_num <- dplyr::select_if(out, is.numeric)
  for (col in colnames(out_num)){
    if (any(is.na(out[col]))){
      val_filled =0
      if (method == 'mean'){
        val_filled = mean(out[[col]], na.rm = TRUE)
      }else if (method == 'median'){
        val_filled = stats::median(out[[col]], na.rm = TRUE)
      }else if (method == 'most_frequent'){
        x = out[[col]]
        x = x[!is.na(x)]
        ux = unique(x)
        val_filled = (ux[which.max(tabulate(match(x, ux)))])[1]
      }else if (method == 'constant'){
        if (!is.null(fill_value)){
          val_filled = fill_value
        }
      }
      out[[col]][is.na(out[[col]])] = val_filled
    }
  }

  return(out)
}
