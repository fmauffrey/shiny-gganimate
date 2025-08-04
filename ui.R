library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(gganimate)
library(here)
library(DT)
library(shinycssloaders)

source(here("ui", "box_main_parameters.R"))
source(here("ui", "box_annotations.R"))
source(here("ui", "box_animation.R"))
source(here("ui", "box_colors_settings.R"))

# Setting loading animation
options(spinner.type = 6)

# UI
dashboardPage(
  skin = "blue",
  title = "Shiny-gganimate",
  
  # Header
  dashboardHeader(title = "Shiny-gganimate"),
  
  # Side bar menu
  dashboardSidebar(
    sidebarMenu(
      # Tabs
      fileInput("data_file", "Samples file", accept = c(".tsv")),
      actionBttn("load_iris_dataset", "Iris dataset", style = "bordered", size = "lg"),
      menuItem("Load table", tabName = "table_tab", icon = icon("table")),
      menuItem("Static Plot", tabName = "static_plot_tab", icon = icon("chart-line")),
      menuItem("Animated Plot", tabName = "animated_plot_tab", icon = icon("wand-sparkles"))
    )),
  
  dashboardBody(
    tabItems(
      # File tab
      tabItem(tabName = "table_tab", 
              fluidRow(
                dataTableOutput("table")
              )
      ),
      
      # Static Plot tab
      tabItem(
        tabName = "static_plot_tab",
        fluidRow(
          column(
            width = 4,
            box_main_parameters(),
            box_annotations(),
            box_colors_settings()
          ),
          column(
            width = 1,
            actionBttn("static_plot_bttn", icon = icon("circle-right"), 
                       style = "pill", color = "success", size = "lg")
          ),
          column(
            width = 7,
            withSpinner(plotOutput("static_plot"))
          )
        )
      ),
      
      # Animated Plot tab
      tabItem(
        tabName = "animated_plot_tab",
        fluidRow(
          column(
            width = 4,
            box_animation()
          ),
          column(
            width = 1,
            actionBttn("animated_plot_bttn", icon = icon("circle-right"), 
                       style = "pill", color = "success", size = "lg")
          ),
          column(
            width = 7,
            withSpinner(uiOutput("animated_plot"))
          )
        )
      )
    )
  )
)