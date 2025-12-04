#' Generate alt-text
#'
#' Generates alt-text for the last drawn plot.
#'
#' Currently uses Google's Gemini. You have to provide `GOOGLE_API_KEY` in the
#' `.Renviron`. For more, see R-package `ellmer`.
#'
#' @return alt-text
#' @export
#'
#' @examples
gen_alt_text <- function() {

  chat <- ellmer::chat_gemini(system_prompt = "You are a statistician, precise and brief. You write in Finnish.")

  chat$chat(
    "Describe this plot in one paragraph, as suitable for inclusion in
   alt-text. You should briefly describe the plot type, the axes, and
   2-5 major visual patterns.",
    ellmer::content_image_plot()
  )

}

#' Title
#'
#' @return
#' @export
#'
#' @examples
analyse_fig <- function(x = NULL) {

  chat <- ellmer::chat_gemini(system_prompt = "You are a statistician and an economist. Your
                              reasoning is based on economic theory, but you critically evaluate
                              whether your reasoning matches the statistical evidence provided.
                              You also tend take the recent events into account in your analysis.")

  message(
  chat$chat(
    paste0("Describe this plot in 3 paragraphs: in the first, you describe the describe
           the plot type, the axes, and 2-5 major visual patterns. In the second, you
           elaborate on the most prominent finding. In the third, you attempt to make
           sense of the finding basing your reasoning on economics theory.", x),
    ellmer::content_image_plot()
  )
  )

}

