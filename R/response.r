response <- function(...) {  
  structure(list(...), class = "response")
}

#' @S3method print response
print.response <- function(x, ..., max.lines = 10) {    
  cat("Response [", x$url, "]\n", sep = "")
  cat("  Status: ", x$status, "\n", sep = "")
  
  if (length(x$text) == 0) return()
  breaks <- str_locate_all(x$text, "\n")[[1]]
  
  lines <- nrow(breaks)
  if (lines > max.lines) {
    last_line <-  breaks[max.lines, 1] - 1
    cat(str_sub(x$text, 1, last_line), "...\n")
  } else {
    cat(x$text, "\n")
  }
}

#' @S3method as.character response
as.character.response <- function(x, ...) {
  x$text
}

