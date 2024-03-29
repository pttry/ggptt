#' Comma decimal formatter
#'
#' Comma decimal formatter: Decimal separator comma.
#'
#' @param x a numeric vector to format
#' @export
#' @return a character vector
#' @examples
#' deci_comma(runif(10, 1, 10)/100)
deci_comma <- function(x){
  format(x, decimal.mark = ",", scientific = FALSE, trim = TRUE)
}


#' Percent and comma formatter
#'
#' Percent formatter: multiply by one hundred and display percent sign after space. Separator comma.
#' addition to scales \code{\link{percent}}
#'
#' @param x a numeric vector to format
#' @export
#' @return a character vector
#' @examples
#' percent_comma(runif(10, 1, 10)/100)
percent_comma <- function(x){
  x <- scales::percent(x)
  x <- gsub("\\.", ",", x)
  x <- gsub("%", " %", x)
  x
}

#' Format numbers above unity
#'
#' @param x numeric
#'
#' @return numeric
#' @export
#'
#' @examples
#' thousand_space(1000000)
thousand_space <- function(x) {
  format(x, big.mark = " ", scientific = FALSE)
}

#' Format numbers below and above unity
#'
#' @param x numeric
#'
#' @return numeric
#' @export
#'
#' @examples
#' format_number(c(100000, 0.234))
format_number <- function(x) {
  sapply(x, function(x) ifelse(abs(x) <= 1, deci_comma(x), thousand_space(x)))
}

#' Year formatter for a two-number format.
#'
#' Uses only 2 last numbers of the year.
#' \code{two_last()} is an alias.
#'
#' @param x a numeric vector to format
#' @export
#' @return a character vector
#' @examples
#'    p <- ggplot(economics, aes(x = date, y = pop))
#'    p + geom_line() + scale_x_date(labels = no_century)
no_century <- function(x){
  substr(x, 3, 4)
}

#' @rdname no_century
#' @export
two_last <- function(x){
  no_century()
}

#' Reverse factors
#'
#' Revers factor levels. Useful to reorder scales.
#'
#' @param x A factor (or other vector)
#' @export
factor_rev <- function(x){
  factor(x, rev(levels(x)))
}
