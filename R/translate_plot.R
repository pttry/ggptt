#' Translate all text in plot
#'
#' @param plot A plot to translate
#' @param trans A named vector of translations
#'
#' @export
#' @import dplyr
#'
#' @examples
#' p <- ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point() +
#'      labs(title = "Test plot", caption = "Source: some")
#' translation <- c("Test plot" = "Testikuvio", wt = "Paino",
#'                  mpg = "Mailia per gallona", Source = "Lähde")
#' p2 <- translate_plot(p, translation)
#'
#' library(patchwork)
#' pp <- p / ((p + geom_point(colour = "blue")) + (p + geom_point(colour = "red")))
#' pp2 <- translate_plot(pp, translation)
translate_plot <- function(plot, trans){


  if (inherits(plot, "patchwork")){

    patches <- patchwork:::get_patches(plot)
    mod_plots <- patches$plots
    mod_plots[[1]] <- translator(patches$plots[[1]], trans)
    mod_plots[[2]][[1]] <- translator(patches$plots[[2]][[1]], trans)
    mod_plots[[2]][[2]] <- translator(patches$plots[[2]][[2]], trans)
    # plots <- plot$patches$plots
    # mod_plots <- purrr::map(patches$plots, ~translator(.x, trans))
    # mod_plots[[2]][[3]] <- NULL
    # plot$patches$plots <- mod_patches

    plot$patches$plots <- mod_plots

    # plot <- patchwork:::add_patches(plot, patches)
    return(plot)
  } else {
    plot <- translator(plot, trans)
    return(plot)
  }

}

translator <- function(plot, trans){
  # print("ok")
  # print(class(plot))
  #
  # if (inherits(plot, "patchwork")){
  #   # purrr::map(plot, ~print("ku"))
  #   patches <- patchwork:::get_patches(plot)
  #   print(length(patches))
  #   mod_plot <- purrr::map(plot, ~translator(.x, trans))
  #   return(mod_plot)
  # }

  if (inherits(plot, "gg")){
    mod_data <- plot$data %>%
      mutate(across(where(is.factor), ~recode(.x, !!!trans))) %>%
      mutate(across(where(is.character), ~recode(.x, !!!trans)))

    plot$data <- mod_data


    plot$labels <- plot$labels %>%
      purrr::map( ~stringi::stri_replace_all_fixed(.x, names(trans), trans, vectorize_all=FALSE))


  } else {
   plot <- plot
  }


  plot

}
