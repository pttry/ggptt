#' Add extra breaks to a continuous scale
#'
#' Add extra breaks to default breaks of \code{\link[ggplot2]{scale_continuous}}.
#'
#' @param extras a numeric vector of extra breaks.
#' @export
#' @examples
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   scale_y_continuous(breaks = extra_breaks(25))
#'
extra_breaks <- function(extras) {
  function(x){
    c(scales::extended_breaks()(x), extras)
  }
}
