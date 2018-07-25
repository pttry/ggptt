#' Shift time 1.5 months
#'
#' Used to shift time a half quarter in quarter charts
#'
#' @param x a Date vector to shift
#'
#' @import lubridate
#'
#' @export
#' @examples
#' halfq_shift(as.Date(c("2018-01-01", "2018-04-01")))
#'
halfq_shift <- function(x){
  x + months(1) + lubridate::days(14)
}


