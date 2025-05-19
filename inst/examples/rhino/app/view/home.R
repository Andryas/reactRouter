box::use(
    app / logic / data
)

x <- data$data

#' @export
ui <- function(id) {
    ns <- shiny::NS(id)

    shiny::uiOutput(ns("project_list"))
}

#' @export
server <- function(id) {
    shiny::moduleServer(id, function(input, output, session) {
        ns <- session$ns

        output$project_list <- shiny::renderUI({
            data <- split(x, seq(nrow(x)))

            project_list <- purrr::map(data, function(.x) {
                shiny::div(
                    shiny.fluent::DocumentCard(
                        styles = list(root = list("max-width" = "100%")),
                        onClickHref = paste0(
                            "#/",
                            .x$id,
                            "/page1"
                        ),
                        shiny.fluent::DocumentCardPreview(
                            previewImages = list(
                                list(
                                    name = "",
                                    previewImageSrc = .x$src, # your image URL here
                                    height = 400
                                )
                            )
                        ),
                        shiny.fluent::DocumentCardTitle(
                            title = .x$title,
                            shouldTruncate = TRUE
                        ),
                        shiny.fluent::DocumentCardTitle(
                            text = .x$details,
                            showAsSecondaryTitle = TRUE
                        )
                    )
                )
            })

            shiny::div(
                class = "row row-cols-1 row-cols-md-3",
                shiny::tagList(project_list)
            )
        })

        return(shiny::reactive({
            current_route <- sub("#/", "", session$clientData$url_hash)
            # print(current_route)
            return(stringr::str_extract(current_route, "\\d+"))
        }))
    })
}
