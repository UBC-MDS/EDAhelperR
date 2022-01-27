data = iris
columns = c('Sepal.Length', 'Sepal.Width', 'Petal.Length')

test_that("The number of columns in summary table is correct.", {
  expect_equal(NCOL(column_stats(data, columns)[[1]]), 8)
})

test_that("The number of rows in summary table is correct.", {
  expect_equal(NROW(column_stats(data, columns)[[1]]), length(columns))
})

test_that("The number of columns equals number of rows in matrices", {
  expect_equal(NCOL(column_stats(data, columns)[[2]]), NROW(column_stats(data, columns)[[2]]))
})

test_that("The number of columns equals number of rows in matrices", {
  expect_equal(NCOL(column_stats(data, columns)[[3]]), NROW(column_stats(data, columns)[[3]]))
})

test_that("Diagonal of covariance matrix is equal to 1", {
  expect_equal(column_stats(data, columns)[[3]][1], 1))
})

test_that("Q1 is smaller than Q3", {
  expect_equal(column_stats(data, columns)[[1]][1,5] <  column_stats(data, columns)[[1]][1,6]))
})
