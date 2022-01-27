# Case 1: Test default inputs
test_that("Expect ggplot object using GeomBar and FacetWrap to be returned", {
  plot <- plot_histogram(iris)
  expect_true("ggplot" %in% class(plot))
  expect_true("GeomBar" %in% class(plot$layers[[1]]$geom))
  expect_true("FacetWrap" %in% class(rlang::get_expr(plot$facet)))
})

# Case 2: Test non-default inputs
test_that("Expect ggplot object using GeomBar and FacetWrap to be returned", {
  plot <- plot_histogram(
    iris,
    columns = c("Petal.Length", "Sepal.Width"),
    num_bins = 20
  )
  expect_true("ggplot" %in% class(plot))
  expect_true("GeomBar" %in% class(plot$layers[[1]]$geom))
  expect_true("FacetWrap" %in% class(rlang::get_expr(plot$facet)))
})

# Case 3: Test exception handling
test_that("Expect errors when function arguments input incorrectly", {
  expect_error(plot_histogram(data = "iris"))
  expect_error(
    plot_histogram(data = iris, columns = list("Petal.Length", "Petal.Width"))
  )
  expect_error(plot_histogram(data = iris, num_bins = "forty"))
})
