#' Function to add new line charter to a character string
#'
#' Useful to wrap labels on several lines. Wrap on word breaks.
#' A factor returs factor.
#'
#' @param x A character string or vector.
#' @param line_lenght A max row lenght (default = 40).
#' @export
#' @examples
#' ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point() +
#'   ggtitle(line_wrap("This is a unneccessary long example title to show
#'   how line_wrap function works"))
line_wrap <- function(x, line_lenght = 40){
  UseMethod("line_wrap", x)
  }

#' @describeIn line_wrap
#' @export
line_wrap.default <- function(x, line_lenght = 40){
  x <- gsub(paste('(.{1,', line_lenght, '})(\\s|$)', sep = ""), '\\1\n', x)
  x <- gsub('\n$', '', x)
  x
}

#' @describeIn line_wrap
#' @export
line_wrap.factor <- function(x, line_lenght){
  y <- x
  x <- levels(x)
  x <- NextMethod("line_wrap", x)
  levels(y) <- x
  y
}




