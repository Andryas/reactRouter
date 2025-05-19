# fmt: skip
#' @export
data <- tibble::tibble(
  id = c(101010, 202020, 303030),
  title = c("Title 1", "Title 2", "Title 3"),
  details = c("Details 1", "Details 2", "Details 3"),
  src = c(
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150"
  ),
  page1_table = list(
    tibble::tibble(metric = c("A", "B", "C"), value = c(10, 20, 30)),
    tibble::tibble(metric = c("A", "B", "C"), value = c(40, 50, 60)),
    tibble::tibble(metric = c("A", "B", "C"), value = c(70, 80, 90))
  ),
  page2_chart = list(
    tibble::tibble(month = c("Jan", "Feb", "Mar"), sales = c(100, 150, 200)),
    tibble::tibble(month = c("Jan", "Feb", "Mar"), sales = c(120, 160, 210)),
    tibble::tibble(month = c("Jan", "Feb", "Mar"), sales = c(130, 170, 220))
  ),
  page3_description = c(
    "This is a detailed description of project Title 1, including background, goals, and milestones.",
    "This is a detailed description of project Title 2, with strategic objectives and implementation steps.",
    "This is a detailed description of project Title 3, outlining technical specs and projected outcomes."
  )
)
