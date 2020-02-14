pacman::p_load(shiny, shiny.semantic, semantic.dashboard, tidyverse, tidytext, demdebates2020, apexcharter)

dir("mods", full.names = T) %>% walk(source)

ui <- dashboardPage(
  dashboardHeader(inverted = T),
  dashboardSidebar(
    side = "left",
    size = "thin",
    #color = "teal",
    inverted = T,
    sidebarMenu(
      menuItem(tabName = "stats", "Statistics")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "stats", statistics_ui("stats"))
    )
  )
)

server <- function(input, output){

  callModule(statistics_server, "stats")

}

shinyApp(ui, server)




















