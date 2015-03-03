#' Color PTT palette (discrete).
#'
#' Color PTT palette (discrete).
#'
#' Palette of colours "darkolivegreen4", "cornflowerblue", "darkorange2", "coral4", "mediumpurple3", "grey50".
#' Recycled if needed (with warning).
#'
#' @param n A number of colour needed.
#' @export
#' @examples
#'  scales::show_col(ptt_pal(6))

ptt_pal <- function(n){
  cols <- c("darkolivegreen4", "cornflowerblue",
            "darkorange2", "coral4", "mediumpurple3",
            "grey50")
  if (n > length(cols)) warning("n is greater than maximum number of ptt colours. Colours are recycled")
  col_seg <- rep(1:length(cols), times = ceiling(n/length(cols)))[1:n]
  cols[col_seg]
}
