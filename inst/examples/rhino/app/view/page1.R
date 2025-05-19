box::use(
    app / logic / data[data]
)

#' @export
ui <- function(id) {
    ns <- shiny::NS(id)
    shiny::tagList(
        shiny::h1("Page 1"),
        shiny::p("This is the first page of the project."),
        shiny::p("Here you can see a table."),
        shiny::p("This is a table that shows the sales data."),
        shiny::p("You can use this table to analyze the sales data."),
        shiny::tableOutput(ns("table"))
    )
}

#' @export
server <- function(id, project_selected) {
    shiny::moduleServer(id, function(input, output, session) {
        ns <- session$ns

        output$table <- shiny::renderTable({
            shiny::req(project_selected())

            data[data$id == as.integer(project_selected()), ][["page1_table"]][[
                1
            ]]
        })
    })
}
