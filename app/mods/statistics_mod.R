statistics_ui <- function(id){
  ns <- NS(id)
  tagList(
    div(class = "row",
      div(class = "six wide column",
        uiOutput(ns("speakers_selection"))
      ),
      div(class = "four wide column",
        shiny.semantic::dropdown(ns("type"), choices = c("line", "heatmap"), value = "heatmap")
      )
    ),
    div(class = "row",
      div(class = "eight wide column",
        apexcharter::apexchartOutput(ns("words"))
      ),
      div(class = "eight wide column",
        apexcharter::apexchartOutput(ns("applause"))
      )
    ),
    div(class = "row",
        div(class = "eight wide column",
            apexcharter::apexchartOutput(ns("laughs"))
        ),
        div(class = "eight wide column",
            apexcharter::apexchartOutput(ns("talks"))
        )
    )
  )
}


statistics_server <- function(input, output, session){

  output$speakers_selection <- renderUI({
    speakers <- demdebates2020::debates %>% dplyr::filter(type == "Candidate") %>% dplyr::count(speaker, sort = T) %>% dplyr::pull(speaker)
    defaults <- speakers[1:5] %>% paste(collapse = ",")
    shiny.semantic::search_selection_choices(session$ns("speakers"), speakers, value = defaults, multiple = T)
  })

  output$words <- apexcharter::renderApexchart({
    req(input$speakers)
    req(input$type)

    demdebates2020::debates %>%
      filter(type == "Candidate") %>%
      filter(speaker %in% stringr::str_split(input$speakers, ",")[[1]]) %>%
      count_words() %>%
      plot_word_counts(input$type)
  })

  output$applause <- apexcharter::renderApexchart({
    req(input$speakers)
    req(input$type)

    print(input$type)

    demdebates2020::debates %>%
      filter(type == "Candidate") %>%
      filter(debate != 8) %>%
      filter(speaker %in% stringr::str_split(input$speakers, ",")[[1]]) %>%
      count_applauses() %>%
      plot_applause_counts(input$type)
  })

  output$laughs <- apexcharter::renderApexchart({
    req(input$speakers)
    req(input$type)

    demdebates2020::debates %>%
      filter(type == "Candidate") %>%
      filter(debate != 8) %>%
      filter(speaker %in% stringr::str_split(input$speakers, ",")[[1]]) %>%
      count_laughs() %>%
      plot_laugh_counts(input$type)
  })

  output$talks <- apexcharter::renderApexchart({
    req(input$speakers)
    req(input$type)

    demdebates2020::debates %>%
      filter(type == "Candidate") %>%
      filter(debate != 8) %>%
      filter(speaker %in% stringr::str_split(input$speakers, ",")[[1]]) %>%
      count_talks() %>%
      plot_talk_counts(input$type)
  })

}
