#' Shift time 1.5 months
#'
#' Used to shift time a half quarter in quarter charts
#'
#' @param x a Date vector to shift
#'
#' @export
#'
halfq_shift <- function(x){
  x + lubridate::months(1) + lubridate::days(14)
}
