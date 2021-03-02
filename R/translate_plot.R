#' Translate all text in plot
#'
#' @param plot A plot to translate
#' @param trans A named vector of translations
#'
#' @export
#' @import dplyr
#'
#' @examples
#' p <- ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point() + labs(title = "Test plot")
#' translation <- c("Test plot" = "Testikuvio", wt = "Paino", mpg = "Mailia per gallona")
#' p2 <- translate_plot(p, translation)
#'
translate_plot <- function(plot, trans){

  mod_data <- plot$data %>%
    mutate(across(where(is.factor), ~recode(.x, !!!trans))) %>%
    mutate(across(where(is.character), ~recode(.x, !!!trans)))

  plot$data <- mod_data


  plot$labels <- plot$labels %>%
    purrr::map( ~recode(.x, !!!trans))

  plot

}
