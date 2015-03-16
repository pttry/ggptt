#' Theme PTT
#'
#' Theme PTT. Based on \code{\link{theme_bw}}. geom defaults from \code{\link{ptt_pal}}
#'
#' @param base_size a font size
#' @param base_family a font
#' @export
theme_ptt <- function(base_size = 12, base_family = ""){
  update_geom_defaults("bar", list(fill = ptt_pal(1)))
  update_geom_defaults("point", list(size = 4, colour = ptt_pal(1)))
  update_geom_defaults("text", list(size = 4, colour = ptt_pal(1)))
  update_geom_defaults("line", list(size = 1.5))
  theme_bw(base_size = base_size, base_family = base_family) +
    theme(plot.margin = grid::unit(c(0.6,0.7,0.5,0.6), "cm"))
}



#' Theme map
#'
#' Theme for maps
#'
#' @param base_size a font size
#' @param base_family a font
#' @export
theme_map <- function(base_size = 12, base_family = ""){
  theme_minimal(base_size = base_size, base_family = base_family) +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
}

