# Initiate the plot
initiate_plot <- function(objects, input){

  if (input$plot_color == "None" && input$plot_fill == "None"){
    objects$static_plot <- ggplot(objects$data, 
                                  aes(x=.data[[input$plot_x]],
                                      y=.data[[input$plot_y]]))
    
  } else if (input$plot_color == "None" && input$plot_fill != "None"){
    objects$static_plot <- ggplot(objects$data, 
                                  aes(x=.data[[input$plot_x]],
                                      y=.data[[input$plot_y]],
                                      fill=.data[[input$plot_fill]]))
    
  } else if (input$plot_color != "None" && input$plot_fill == "None"){
    objects$static_plot <- ggplot(objects$data, 
                                  aes(x=.data[[input$plot_x]],
                                      y=.data[[input$plot_y]],
                                      color=.data[[input$plot_color]]))
    
  } else if (input$plot_color != "None" && input$plot_fill != "None"){
    objects$static_plot <- ggplot(objects$data, 
                                  aes(x=.data[[input$plot_x]],
                                      y=.data[[input$plot_y]],
                                      color=.data[[input$plot_color]],
                                      fill=.data[[input$plot_fill]]))
  }
}