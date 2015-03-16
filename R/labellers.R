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
