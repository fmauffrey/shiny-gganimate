# Initiate the plot
initiate_plot <- function(objects, input){
  objects$static_plot <- ggplot(objects$data, 
                                aes(x=.data[[input$plot_x]],
                                    y=.data[[input$plot_y]]))
}