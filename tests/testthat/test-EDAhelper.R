#' Create the expected data frame for tests
#'
#' @param case
#' case = 2 : expected data frame for method = 'mean'
#' case = 3 : expected data frame for method = 'median'
#' case = 4 : expected data frame for method = 'most_frequent'
#' case = 5 : expected data frame for method = 'constant'
#' case = 6 : expected data frame for method = 'constant' & fill_value = 9999
#'
#' @return data.frame
#' @export
#'
#' @examples
#' get_expected_results(2)
get_expected_results <- function(case){
  if (case == 2){
    out <- data.frame(col_1 = c(1.25, 1.0, 1.0, 3.0, 0.0),
                  col_2 = c(1.0, 2.0, 8.0/3, 5.0, 8.0/3),
                  col_3 = c('a', 'b', 'c', 'd', NA))
    return(out)
  }else if (case == 3){
    out <- data.frame(col_1 = c(1.0, 1.0, 1.0, 3.0, 0.0),
                      col_2 = c(1.0, 2.0, 2.0, 5.0, 2.0),
                      col_3 = c('a', 'b', 'c', 'd', NA))
    return(out)
  }else if (case == 4){
    out <- data.frame(col_1 = c(1.0, 1.0, 1.0, 3.0, 0.0),
                      col_2 = c(1.0, 2.0, 1.0, 5.0, 1.0),
                      col_3 = c('a', 'b', 'c', 'd', NA))
    return(out)
  }else if (case == 5){
    out <- data.frame(col_1 = c(0, 1.0, 1.0, 3.0, 0.0),
                      col_2 = c(1.0, 2.0, 0, 5.0, 0),
                      col_3 = c('a', 'b', 'c', 'd', NA))
    return(out)
  }else if (case == 6){
    out <- data.frame(col_1 = c(9999, 1.0, 1.0, 3.0, 0.0),
                      col_2 = c(1.0, 2.0, 9999, 5.0, 9999),
                      col_3 = c('a', 'b', 'c', 'd', NA))
    return(out)
  }
  return(NA)
}

# Case 1: To test default settings and return
test_that('Test data read incorrectly!', {
  file_path <- 'https://raw.githubusercontent.com/pandas-dev/pandas/main/doc/data/titanic.csv'
  actual_tibble <- preprocess(file_path)
  expect_true(is.data.frame(actual_tibble))
})

# Case 2: To test method = 'mean'
test_that("method='mean' applied incorrectly!", {
  file_path = './data_preprocess.csv'
  actual_tibble <- preprocess(file_path, method = 'mean', col_select = -1)
  expected_tibble <- get_expected_results(2)
  cmp_result <- nrow(dplyr::setdiff(actual_tibble, expected_tibble)) == 0 & nrow(dplyr::setdiff(expected_tibble, actual_tibble)) == 0
  expect_true(cmp_result)
})

# Case 3: To test method = 'median'
test_that("method='median' applied incorrectly!", {
  file_path = './data_preprocess.csv'
  actual_tibble <- preprocess(file_path, method = 'median', col_select = -1)
  expected_tibble <- get_expected_results(3)
  cmp_result <- nrow(dplyr::setdiff(actual_tibble, expected_tibble)) == 0 & nrow(dplyr::setdiff(expected_tibble, actual_tibble)) == 0
  expect_true(cmp_result)
})

# Case 4: To test method = 'most_frequent'
test_that("method='most_frequent' applied incorrectly!", {
  file_path = './data_preprocess.csv'
  actual_tibble <- preprocess(file_path, method = 'most_frequent', col_select = -1)
  expected_tibble <- get_expected_results(4)
  cmp_result <- nrow(dplyr::setdiff(actual_tibble, expected_tibble)) == 0 & nrow(dplyr::setdiff(expected_tibble, actual_tibble)) == 0
  expect_true(cmp_result)
})

# Case 5: To test method = 'constant' and fill_value = NULL
test_that("method='constant' applied incorrectly!", {
  file_path = './data_preprocess.csv'
  actual_tibble <- preprocess(file_path, method = 'constant', col_select = -1)
  expected_tibble <- get_expected_results(5)
  cmp_result <- nrow(dplyr::setdiff(actual_tibble, expected_tibble)) == 0 & nrow(dplyr::setdiff(expected_tibble, actual_tibble)) == 0
  expect_true(cmp_result)
})

# Case 6: To test method = 'constant' and fill_value = 9999
test_that("method='constant', fill_value=9999 applied incorrectly!", {
  file_path = './data_preprocess.csv'
  actual_tibble <- preprocess(file_path, method = 'constant', fill_value = 9999, col_select = -1)
  expected_tibble <- get_expected_results(6)
  cmp_result <- nrow(dplyr::setdiff(actual_tibble, expected_tibble)) == 0 & nrow(dplyr::setdiff(expected_tibble, actual_tibble)) == 0
  expect_true(cmp_result)
})

# Case 7: To test error
test_that("Exception handling doesn't work", {
  file_path = './data_preprocess.csv'
  expect_error(preprocess(file_path, method = 'nnn'))
  expect_error(preprocess(5, method = 'nnn'))
  expect_error(preprocess(file_path, method = 'constant', fill_value = '0.0'))
  expect_error(preprocess(file_path, method = 'constant', zz = '0.0'))
})
