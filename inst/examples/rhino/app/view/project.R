# fmt: skip
links <- tibble::tribble(
  ~ route, ~ name, ~ icon,
  '','Projects', 'FolderOpen',
  'page1','Page 1', 'Package',
  'page2','Page 2', 'ProjectCollection',
  'page3','Page 3', 'Money'
)

#' @export
ui <- function(id) {
    ns <- shiny::NS(id)
    shiny::div(
        class = "grid-container",
        shiny::div(
            class = "sidenav",
            shiny::uiOutput(ns("navbar"))
        ),
        shiny::uiOutput(ns("navbar")),
        shiny::div(
            class = "main",
            reactRouter::Outlet()
        ),
    )
}

#' @export
server <- function(id, project_selected) {
    shiny::moduleServer(id, function(input, output, session) {
        ns <- session$ns

        output$navbar <- shiny::renderUI({
            shiny::req(project_selected())

            navigation <- shiny.fluent::Nav(
                groups = list(
                    list(
                        links = (purrr::map(
                            split(links, seq(nrow(links))),
                            function(.x) {
                                list(
                                    name = .x$name,
                                    url = ifelse(
                                        .x$route == "",
                                        "#/",
                                        paste0(
                                            "#/",
                                            project_selected(),
                                            "/",
                                            .x$route
                                        )
                                    ),
                                    key = .x$route,
                                    icon = .x$icon
                                )
                            }
                        ) |>
                            unname())
                    )
                ),
                initialSelectedKey = '',
                styles = list(
                    root = list(
                        height = '100%',
                        boxSizing = 'border-box',
                        overflowY = 'auto'
                    )
                )
            )
            
            shiny::div(class = "sidenav", navigation)
        })
    })
}
