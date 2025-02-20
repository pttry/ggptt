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
