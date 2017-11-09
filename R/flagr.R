#' Add a flag
#'
#' Add a flag icon
#'
#' @param flag \href{https://www.iso.org/obp/ui/#search/code/}{ISO 3166-1-alpha-2} code of a country, see examples.
#' @param squared if \code{TRUE} will use square flag.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId id of \code{<span>} (optional).
#'
#' @examples
#' flagr("be") # belgian flag
#' flagr("gr") # greek flag
#' flagr("us", width = 100, height = 60) # us flag
#' flagr("ch", squared = TRUE) # swiss flag squared
#'
#' @details flag-icon css \href{http://flag-icon-css.lip.is/}{demo}.
#'
#' @seealso flag-icons css \href{http://flag-icon-css.lip.is/}{demo}, on
#' \href{https://github.com/lipis/flag-icon-css}{github}
#'
#' @import htmlwidgets
#'
#' @export
flagr <- function(flag, squared = FALSE, width = NULL, height = NULL, elementId = NULL) {

  if(missing(flag)) stop("Missing flag", call. = FALSE)

  # forward options using x
  x = list(
    flag = flag,
    squared = squared
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'flagr',
    x,
    width = width,
    height = height,
    package = 'flagr',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = 60,
      defaultHeight = 40,
      viewer.fill = FALSE
    )
  )
}

flagr_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = paste0("flag-icon ", class))
}

#' Shiny bindings for flagr
#'
#' Output and render functions for using flagr within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a flagr
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name flagr-shiny
#'
#' @export
flagrOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'flagr', width, height, package = 'flagr')
}

#' @rdname flagr-shiny
#' @export
renderFlagr <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, flagrOutput, env, quoted = TRUE)
}
