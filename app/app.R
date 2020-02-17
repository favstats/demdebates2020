library(demdebates2020)
library(shiny)
library(shiny.semantic)
library(semantic.dashboard)
library(tidyverse)
library(tidytext)
library(apexcharter)


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




















