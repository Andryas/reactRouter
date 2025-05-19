box::use(
  app / view / home,
  app / view / project,
  app / view / page1,
  app / view / page2,
  app / view / page3
)

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    # dependencies, e.g, shinyjs::useShinyjs(),
    bslib::page(
      reactRouter::HashRouter(
        reactRouter::Routes(
          reactRouter::Route(
            path = "/",
            element = home$ui(ns("home"))
          ),
          reactRouter::Route(
            path = "/:projectId/*",
            element = project$ui(ns("project")),
            children = list(
              reactRouter::Route(
                path = "page1",
                element = page1$ui(ns("page1"))
              ),
              reactRouter::Route(
                path = "page2",
                element = page2$ui(ns("page2"))
              ),
              reactRouter::Route(
                path = "page3",
                element = page3$ui(ns("page3"))
              )
            )
          )
          # reactRouter::Route(path = "*", element = "Custom error 404")
        )
      )
    )
  )
}

#' @export
server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    project_selected <- home$server("home")

    shiny::observe({
      shiny::req(project_selected())

      print(project_selected())
    })

    project$server("project", project_selected = project_selected)
    page1$server("page1", project_selected = project_selected)
    page2$server("page2", project_selected = project_selected)
    page3$server("page3", project_selected = project_selected)
  })
}
