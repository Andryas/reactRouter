box::use(
    app / logic / data[data],
    ggplot2[...]
)

#' @export
ui <- function(id) {
    ns <- shiny::NS(id)
    shiny::tagList(
        shiny::h2("Page 2"),
        shiny::p("This is the second page of the project."),
        shiny::p("Here you can see a chart."),
        shiny::hr(),
        shiny::h3("Chart"),
        shiny::p("This is a chart that shows the sales data."),
        shiny::p("You can use this chart to analyze the sales data."),
        shiny::p(
            "You can also use this chart to compare the sales data with other projects."
        ),
        shiny::plotOutput(ns("chart"))
    )
}

#' @export
server <- function(id, project_selected) {
    shiny::moduleServer(id, function(input, output, session) {
        ns <- session$ns

        output$chart <- shiny::renderPlot({
            shiny::req(project_selected())

            data[data$id == as.integer(project_selected()), ][["page2_chart"]][[
                1
            ]] |>
                ggplot(aes(x = month, y = sales)) +
                geom_col()
        })
    })
}
