#' Summarize the number of people killed in motor vehicle accidents in the US by given year and month
#'
#' @param years An integer vector of years you want to summarize data from.
#' @return This function returns a number of envents summary table as tibble grouped by month and year
#'
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom dplyr n
#' @importFrom tidyr spread
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(.data$year, .data$MONTH) %>%
    dplyr::summarize(n= dplyr::n()) %>%
    tidyr::spread(.data$year, .data$n)
}
