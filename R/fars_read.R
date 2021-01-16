#' Read in a CSV file
#'
#' Create a tibble from CSV file
#'
#' @param filename as a character
#'
#' @return tibble
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @export
#'
#' @examples
#' filefromfamove <- system.file("extdata", "accident_2013.csv.bz2", package = "famove")
#' fars_read(filefromfamove)
#'
#'
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
