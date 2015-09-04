#' Set PTT theme and scales
#'
#' Set \code{\link{theme_ptt}}, see \code{\link[ggplot2]{theme_set}}, and
#' \code{\link{scale_colour_ptt}} as \code{\link[ggplot2]{scale_colour_discrete}}
#' and
#' \code{\link{scale_fill_ptt}} as \code{\link[ggplot2]{scale_fill_discrete}}
#'
#' Scales are assign in \code{ggptt_sets} environment.
#' `unset_ptt()` is used to restore theme and scales berofe
#' `set_ptt()`.
#'
#' @export
#' @family set
#' @examples
#' l_df <- data.frame(t = c(1,2,3), y = c(4,3,5, 5,7,6), cc = c(1,1,1,2,2,2))
#' ggplot(l_df, aes(t, y, colour = factor(cc))) + geom_line()
#' set_ptt()
#' ggplot(l_df, aes(t, y, colour = factor(cc))) + geom_line()
set_ptt <- function() {
  # environment for sets
  if (!("ggptt_sets" %in% search())) {
    e <- new.env()
    attach(e, name = "ggptt_sets", warn.conflicts = FALSE)
  }


  # theme
  old_theme <- ggplot2::theme_set(theme_ptt())
  assign("old_theme", old_theme,
         pos = "ggptt_sets")

  # defaults for scales

  scale_colour_discrete <- function(...) scale_colour_ptt(...)
  scale_fill_discrete <- function(...) scale_fill_ptt(...)

  assign("scale_colour_discrete", scale_colour_discrete,
         pos = "ggptt_sets")
  assign("scale_fill_discrete", scale_fill_discrete,
         pos = "ggptt_sets")

}

#' Set theme and scales
#'
#' Set theme, see \code{\link[ggplot2]{theme_set}} and set scales
#' \code{\link{scale_colour_ptt}}
#' and
#' \code{\link{scale_fill_ptt}} to use palette.
#'
#' Scales are assign in \code{ggptt_sets} environment.
#' `unset_gg()` is used to restore theme and scales berofe
#' `set_gg()`.
#'
#' @param theme a ggplot2 theme
#' @param palette a palette funtion or a name of the ggptt intern palette.
#'    See \code{names(ggptt_palettes)}.
#' @export
#' @family set
#' @examples
#' l_df <- data.frame(t = c(1,2,3), y = c(4,3,5, 5,7,6), cc = c(1,1,1,2,2,2))
#' p <- ggplot(l_df, aes(t, y, colour = factor(cc))) + geom_line()
#' p
#' set_gg(theme_ptt(), "ptt")
#' p
set_gg <- function(theme, palette) {
  # environment for sets
  if (!("ggptt_sets" %in% search())) {
    e <- new.env()
    attach(e, name = "ggptt_sets", warn.conflicts = FALSE)
  }


  # theme
  old_theme <- ggplot2::theme_set(theme)
  assign("old_theme", old_theme,
         pos = "ggptt_sets")

  # defaults for scales

  if (is.function(palette)){
    pal <- palette
  } else {
    pal <- function(n) ggptt_pal(n, palette)
  }


  scale_colour_discrete <-
    function(...) discrete_scale("colour", "ggptt", pal, ...)

  scale_fill_discrete <-
    function(...) discrete_scale("fill", "ggptt", pal, ...)

  assign("scale_colour_discrete", scale_colour_discrete,
         pos = "ggptt_sets")
  assign("scale_color_discrete", scale_colour_discrete,
         pos = "ggptt_sets")
  assign("scale_fill_discrete", scale_fill_discrete,
         pos = "ggptt_sets")

}


#' @describeIn set_ptt
#' @export
unset_ptt <- function(){
  if (("ggptt_sets" %in% search())){
    theme_set(get("old_theme", "ggptt_sets"))
    detach("ggptt_sets")
    message("ggptt unset.")
  }
}

#' @describeIn set_gg
#' @export
unset_gg <- function(){
  if (("ggptt_sets" %in% search())){
    theme_set(get("old_theme", "ggptt_sets"))
    detach("ggptt_sets")
    message("ggptt unset.")
  }
}
