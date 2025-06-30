source(here("server", "customize_plot.R"))
source(here("server", "initiate_plot.R"))
source(here("server", "animate_plot.R"))

server <- function(input, output, session) {

  # Create www folder if non existing ####################
  
  objects <- reactiveValues(data = NULL,
                  static_plot = NULL,
                  animated_plot = NULL,
                  animated_path = NULL)
  
  observe({
    parameters <- setNames(as.list(colnames(objects$data)), colnames(objects$data))
    updateSelectInput(session, "plot_x", choices=parameters)
    updateSelectInput(session, "plot_y", choices=parameters)
    updateSelectInput(session, "plot_color", choices=c("None" = "None", parameters))
    updateSelectInput(session, "plot_fill", choices=c("None" = "None", parameters))
    updateSelectInput(session, "transition", choices=parameters)
  })
  
  observeEvent(input$load_iris_dataset, {
    objects$data <- iris
  })
  
  observeEvent(input$static_plot_bttn, {
    initiate_plot(objects, input)
    customize_plot(objects, input)
  })
  
  output$static_plot <- renderPlot(
    if (!is.null(objects$static_plot)){
      objects$static_plot
    } else {
      return(NULL)
    }
  )
  
  observeEvent(input$animated_plot_bttn, {
    initiate_plot(objects, input)
    customize_plot(objects, input)
    animate_plot(objects, input)
    objects$animated_path <- tempfile(fileext = ".gif", tmpdir="www")
    animate(objects$animated_plot, renderer=gifski_renderer(objects$animated_path))
  })
  
  ### Output objects ##########################################################
  
  # Data table
  output$table <- renderDataTable(
    objects$data
    )
  
  # Static plot
  output$static_plot <- renderPlot(
    if (!is.null(objects$static_plot)){
      objects$static_plot
    } else {
      return(NULL)
    }
  )
  
  # Animated plot
  output$animated_plot <- renderUI(
    if (!is.null(objects$animated_path)){
      img(src = basename(objects$animated_path))
    } else {
      return(NULL)
    }
  )
  
}