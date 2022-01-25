df <- data.frame(names=c("Vera", "Jennifer", "Rowan", "Steven"),
                 scores =c(90, 80, 70, 80),
                 age=c(12, 23, 20, 100))

test_that("Check for non-dataframe argument works.", {
  expect_error(numeric_plots("a"))
})

df_no_rows <- data.frame("names"=c())
test_that("Check for a dataframe with at least 1 row works.", {
  expect_error(numeric_plots(df_no_rows))
})

df_1_numeric_col <- df |>
  dplyr::select(names, scores)
test_that("Check for a dataframe with at least 2 numeric columns works.", {
  expect_error(numeric_plots(df_1_numeric_col))
})

test_that("The return object type is correct.", {
  expect_equal(class(numeric_plots(df)), c('gg', 'ggmatrix'))
})

