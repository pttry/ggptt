#' Function to add new line charter to a character string
#'
#' Useful to wrap labels on several lines. Wrap on word breaks.
#'
#' @param x a character string or vector.
#' @param row_lenght a max row lenght default = 40.
#' @export
#' @example
#' ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point() +
#'   ggtitle(line_wrap("This is a unneccessary long example title to show how line_wrap function works"))
line_wrap <- function(x, line_lenght =  40){
  x <- gsub(paste('(.{1,', line_lenght, '})(\\s|$)', sep = ""), '\\1\n', x)
  x <- gsub('\n$', '', x)
  x
}
