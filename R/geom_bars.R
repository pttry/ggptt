#' Bars with stat identity
#'
#' @param position Argument to \code{\link{geom_bar}}. Default \code{"dodge"}.
#' @param ... Arguments to \code{\link{geom_bar}}.
#' @export
#' @import ggplot2

geom_bari <- function(position = "dodge", ...){
  geom_bar(stat = "identity", position = position, ...)
}
