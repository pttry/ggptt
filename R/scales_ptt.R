#' PTT colour and fill scale
#'
#' Discrete PTT colour scale. Colours from \code{\link{ptt_pal}}.
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

#' @rdname scale_fill_ptt
#' @export
scale_colour_ptt <- function(...){
  discrete_scale("colour", "ptt", ptt_pal, ...)
}


#' @rdname scale_fill_ptt
#' @export
scale_color_ptt <- function(...){
  discrete_scale("colour", "ptt", ptt_pal, ...)
}


#' @rdname scale_fill_ptt
#' @export
scale_colour_ptt_lg <- function(...){
  discrete_scale("colour", "ptt_lg", ptt_pal_lg, ...)
}

#' @rdname scale_fill_ptt
#' @export
scale_color_ptt_lg <- function(...){
  discrete_scale("colour", "ptt_lg", ptt_pal_lg, ...)
}
