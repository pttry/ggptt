#' Color palettes in ggptt package.
#'
#' Color palettes in ggptt package (discrete).
#'
#' Colors in palerres are recycled if needed (with warning).
#'
#' Available palettes are: ptt, vnk.
#'
#' @param n A number of colour needed.
#' @param name A name of the palette. See \code{names(ggptt_palettes)}.
#' @export
#' @family ggptt_pal
#' @examples
#'  scales::show_col(ggptt_pal(n = 6, name = "ptt"))
#'  scales::show_col(ggptt_pal(n = 6, name = "vnk"))

ggptt_pal <- function(n, name){
  cols <- ggptt_palettes[[name]]
  if (is.null(cols)) stop(name, " is not a valid palette name for ggptt_pal")
  if (n > length(cols))
    warning("n is greater than maximum number of colours in ", name,
            "palette. Colours are recycled")
  col_seg <- rep(1:length(cols), times = ceiling(n/length(cols)))[1:n]
  cols[col_seg]
}



#' Color palette PTT.
#'
#' Color palette for PTT (discrete).
#'
#' Palette of colours "darkolivegreen4", "cornflowerblue", "darkorange2", "coral4", "mediumpurple3", "grey50".
#' Recycled if needed (with warning).
#'
#' @param n A number of colour needed.
#' @export
#' @family ggptt_pal
#' @examples
#'  scales::show_col(ptt_pal(6))

ptt_pal <- function(n){
  ggptt_pal(n, "ptt")
}

#' Color palette VNK.
#'
#' Color palette for VNK (Finnish Prime Ministers Office) publications (discrete).
#'
#' Palette of colours blue, light blue, grey and black.
#' Recycled if needed (with warning).
#'
#' @param n A number of colour needed.
#' @export
#' @family ggptt_pal
#' @examples
#'  scales::show_col(vnk_pal(6))

vnk_pal <- function(n){
  ggptt_pal(n, "vnk")
}


#' Palettes in ggptt
#'
#' A named list of colours.
#'
#' See \code{names(ggptt_palettes)}.
#' @export
#'
"ggptt_palettes"
