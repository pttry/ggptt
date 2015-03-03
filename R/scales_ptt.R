#' PTT colour scales
#'
#' Discrete PTT colour scales. Colours for \code{\link{ptt_pal}}.
#'
#' @param ... Other arguments passed on to \code{\link{discrete_scale}}.
#' @export
#' @examples
#'  dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
#'  (d <- ggplot(dsamp, aes(carat, price, colour = clarity)) + geom_point())
#'
#'  d + scale_colour_ptt()

scale_fill_ptt <- function(...){
  discrete_scale("fill", "ptt", ptt_pal, ...)
}

#' @describeIn scale_fill_ptt
#' @export
scale_colour_ptt <- function(...){
  discrete_scale("colour", "ptt", ptt_pal, ...)
}

#' @describeIn scale_fill_ptt
#' @export
scale_color_ptt <- function(...){
  discrete_scale("colour", "ptt", ptt_pal, ...)
}
