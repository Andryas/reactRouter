box::use(
    app / logic / data[data]
)

#' @export
ui <- function(id) {
    ns <- shiny::NS(id)
    shiny::tagList(
        shiny::h2("Page 3"),
        shiny::p("This is the third page of the project."),
        shiny::p("Here you can see a description."),
        shiny::textOutput(ns("description"))
    )
}

#' @export
server <- function(id, project_selected) {
    shiny::moduleServer(id, function(input, output, session) {
        ns <- session$ns

        output$description <- shiny::renderText({
            shiny::req(project_selected())

            data[data$id == as.integer(project_selected()), ][[
                "page3_description"
            ]][[
                1
            ]]
        })
    })
}
