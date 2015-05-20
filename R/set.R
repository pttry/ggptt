#' Set PTT theme and scales
#'
#' Set \code{\link{theme_ptt}}, see \code{\link[ggplot2]{theme_set}}, and
#' \code{\link{scale_colour_ptt}} as \code{\link[ggplot2]{scale_colour_discrete}}
#' and
#' \code{\link{scale_fill_ptt}} as \code{\link[ggplot2]{scale_fill_discrete}}
#'
#' Scales are assign in \code{ggptt_sets} environment.
#'
#' @export
#' @examples
#' l_df <- data.frame(t = c(1,2,3), y = c(4,3,5, 5,7,6), cc = c(1,1,1,2,2,2))
#' ggplot(l_df, aes(t, y, colour = factor(cc))) + geom_line()
#' set_ptt()
#' ggplot(l_df, aes(t, y, colour = factor(cc))) + geom_line()



set_ptt <- function() {
  # theme
  ggplot2::theme_set(theme_ptt())

  # defaults for scales
  e <- new.env()

  e$scale_colour_discrete <- function(...) scale_colour_ptt(...)
  e$scale_fill_discrete <- function(...) scale_fill_ptt(...)

  attach(e, name = "ggptt_sets", warn.conflicts = FALSE)

}


