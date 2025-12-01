
# irisEDA

Simple, clean summaries for exploratory data analysis, demonstrated with
the iris dataset.

## Installation

You can install the development version of irisEDA from \[GitHub\]:

``` r
# install.packages("remotes")
remotes::install_github("lyndseyg05/irisEDA")
```

## Example

Load the package and try it with the built-in iris dataset:

``` r
library(irisEDA)
data(iris)

# Numeric summary
summarize_numeric(iris, "Sepal.Length")

# Categorical summary
summarize_categorical(iris, "Species")

# Dataframe summary
summarize_dataframe(iris)
#> Numeric summaries:
#> 
#> 
#> variable          n   n_missing       mean   median          sd   min   q25   q75   max
#> -------------  ----  ----------  ---------  -------  ----------  ----  ----  ----  ----
#> Sepal.Length    150           0   5.843333     5.80   0.8280661   4.3   5.1   6.4   7.9
#> Sepal.Width     150           0   3.057333     3.00   0.4358663   2.0   2.8   3.3   4.4
#> Petal.Length    150           0   3.758000     4.35   1.7652982   1.0   1.6   5.1   6.9
#> Petal.Width     150           0   1.199333     1.30   0.7622377   0.1   0.3   1.8   2.5
#> 
#> Categorical summaries:
#> 
#> 
#> variable   value          n    prop
#> ---------  -----------  ---  ------
#> Species    setosa        50   0.333
#> Species    versicolor    50   0.333
#> Species    virginica     50   0.333
```
