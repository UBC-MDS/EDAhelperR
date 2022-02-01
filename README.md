
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EDAhelperR

<!-- badges: start -->
<!-- badges: end -->

Tools to make EDA easier!

## About

This package is aimed at making the EDA process more effective.
Basically, we found there were tons of repetitive work when getting a
glimpse of the data set. To stop wasting time in repeating procedures,
our team came up with the idea to develop a toolkit that includes the
following functions:

1.  Clean the data and replace missing values by using the method
    preferred.
2.  Provide the description of the data such as the distribution of each
    column of the data.
3.  Give the correlation plot between different numeric columns
    automatically.
4.  Combine the plots and make them suitable for the report.

## Contributors

-   Rowan Sivanandam
-   Steven Leung
-   Vera Cui
-   Jennifer Hoang

## Feature specifications

1.  `preprocess(path, method=NULL, fill_value=NULL, read_func=readr::read_csv, ...)`
    :<br> The function is to preprocess data in txt or csv by dealing
    with missing values. There are 5 imputation methods provided (NULL,
    ‘most_frequent’, ‘mean’, ‘median’, ‘constant’). Finally, it will
    return the processed data as a tibble.
2.  `column_stats(data, columns)` :<br> The function is to obtain
    summary statistics of column(s) including count, mean, median, mode,
    Q1, Q3, variance, standard deviation, correlation, and covariance in
    table format. Finally, it will return a tibble.
3.  `numeric_plots(df)` :<br> The function is to generate scattered plot
    matrix of numeric features for EDA. Finally, it will return a GGally
    plot object with the scattered plot matrix of numeric features.
4.  `plot_histogram(data, columns = "all", num_bins = 30)` :<br> The
    function is to create histograms for numerical features within a
    dataframe using ggplot2. Finally, it will return a ggplot object.

## Related projects

Surely, EDA is not a new topic to data scientists. There are quite a few
packages doing similar work on
[`CRAN`](https://cran.r-project.org/web/packages/available_packages_by_name.html).
However, most of them only include limited functions like just providing
descriptive statistics. Our proposal is more of a one-in-all toolkit for
EDA. Below is a list of sister-projects.

-   [`brinton`](https://cran.r-project.org/web/packages/brinton/index.html)
    : A Graphical EDA Tool
-   [`correlationfunnel`](https://cran.r-project.org/web/packages/correlationfunnel/index.html)
    : Speed Up Exploratory Data Analysis (EDA) with the Correlation
    Funnel
-   [`ezEDA`](https://cran.r-project.org/web/packages/ezEDA/index.html)
    : Task Oriented Interface for Exploratory Data Analysis

## Installation

You can install the released version of `EDAhelperR` from this repo at
the R console:<br>

    devtools::install_github('UBC-MDS/EDAhelperR')

## Usage

Example usage:

    library(EDAhelperR)

    preprocess(readr::readr_example("mtcars.csv"))

    column_stats(iris, c('Sepal.Length', 'Sepal.Width', 'Petal.Length'))

    numeric_plots(df)

    plot_histogram(mtcars)

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## License

`EDAhelperR` was created by Rowan Sivanandam, Steven Leung, Vera Cui,
Jennifer Hoang. It is licensed under the terms of the MIT license.

## Credits

`EDAhelperR` was created with
[`usethis`](https://usethis.r-lib.org/index.html).

<!-- ## Installation -->
<!-- You can install the released version of EDAhelperR from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("EDAhelperR") -->
<!-- ``` -->
<!-- ## Example -->
<!-- This is a basic example which shows you how to solve a common problem: -->
<!-- ```{r example} -->
<!-- library(EDAhelperR) -->
<!-- ## basic example code -->
<!-- ``` -->
<!-- What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so: -->
<!-- ```{r cars} -->
<!-- summary(cars) -->
<!-- ``` -->
<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>. -->
<!-- You can also embed plots, for example: -->
<!-- ```{r pressure, echo = FALSE} -->
<!-- plot(pressure) -->
<!-- ``` -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->
