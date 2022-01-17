#'Save plots
#'
#' @param filename File name to create on disk without extension
#' @param file_path A path to save file. Default is user Downloads folder.
#' @param plot Plot to save, defaults to last plot displayed.
#' @param height Plot height.
#'
#'
#' @export
#'
ggsave_twitter <- function(filename,
                           file_path = file.path(Sys.getenv("USERPROFILE"),"Downloads"),
                           plot = last_plot()){
  plot2 = plot +
    ggplot2::theme(text = element_text(size = 14)) +
    ggplot2::theme(
      plot.subtitle = ggplot2::element_text(colour = "grey40"),
      plot.caption = ggplot2::element_text(size = 10, face = "plain", colour = "grey40"),
      text = ggplot2::element_text(face = "plain"),
      plot.margin = ggplot2::margin(1, 1, 2, 1))
  ggplot2::ggsave(file.path(file_path, paste0(filename, ".png")),
                  plot = plot2,
                  width = 16/2,
                  height = 9/2)
}



#' @describeIn ggsave_twitter
#'
#' @export
#'
ggsave_blog <- function(filename,
                        file_path = file.path(Sys.getenv("USERPROFILE"),"Downloads"),
                        plot = last_plot(),
                        height = 5){
  plot2 = plot +
    ggplot2::theme(text = element_text(size = 14)) +
    ggplot2::theme(
      plot.subtitle = ggplot2::element_text(colour = "grey40"),
      plot.caption = ggplot2::element_text(size = 10, face = "plain", colour = "grey40"),
      text = ggplot2::element_text(face = "plain"),
      plot.margin = ggplot2::margin(2, 3, 3, 2))
  ggplot2::ggsave(file.path(file_path, paste0(filename, ".png")),
                  plot = plot2,
                  width = 7,
                  height = height)
}


#' @describeIn ggsave_twitter Save to ppt-slide a half slide plot.
#'
#' @export
#'
ggsave_ppt_half <- function(filename,
                        file_path = file.path(Sys.getenv("USERPROFILE"),"Downloads"),
                        plot = last_plot()){
  plot2 = plot +
    ggplot2::theme(text = element_text(size = 20)) +
    ggplot2::theme(
      plot.subtitle = ggplot2::element_text(colour = "grey40"),
      plot.caption = ggplot2::element_text(size = 12, face = "plain", colour = "grey40"),
      text = ggplot2::element_text(face = "plain"),
      plot.margin = ggplot2::margin(1, 2, 2, 1))
  ggplot2::ggsave(file.path(file_path, paste0(filename, ".png")),
                  plot = plot2,
                  width = 7.7,
                  height = 7)
}


#' @describeIn ggsave_twitter Save to ppt-slide a whole slide plot.
#'
#' @export
#'
ggsave_ppt <- function(filename,
                            file_path = file.path(Sys.getenv("USERPROFILE"),"Downloads"),
                            plot = last_plot()){
  plot2 = plot +
    ggplot2::theme(text = element_text(size = 20)) +
    ggplot2::theme(
      plot.subtitle = ggplot2::element_text(colour = "grey40"),
      plot.caption = ggplot2::element_text(size = 12, face = "plain", colour = "grey40"),
      text = ggplot2::element_text(face = "plain"),
      plot.margin = ggplot2::margin(1, 2, 2, 1))
  ggplot2::ggsave(file.path(file_path, paste0(filename, ".png")),
                  plot = plot2,
                  width = 16,
                  height = 7)
}
