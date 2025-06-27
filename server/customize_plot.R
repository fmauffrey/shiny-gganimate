# Modify the plot with user inputs
customize_plot <- function(objects, input){
  
  # Plot type
  if (input$plot_type == "Scatter plot"){
    objects$static_plot <- objects$static_plot + geom_point()
  } else if (input$plot_type == "Histogram"){
    objects$static_plot <- objects$static_plot + geom_histogram()
  } else if (input$plot_type == "Bar"){
    objects$static_plot <- objects$static_plot + geom_bar()
  } else if (input$plot_type == "Boxplot"){
    objects$static_plot <- objects$static_plot + geom_boxplot()
  } else if (input$plot_type == "Violin plot"){
    objects$static_plot <- objects$static_plot + geom_violin()
  }
  
  # Title and names
  if (input$x_axis_name != ""){
    objects$static_plot <- objects$static_plot + xlab(input$x_axis_name)
  }
  if (input$y_axis_name != ""){
    objects$static_plot <- objects$static_plot + ylab(input$y_axis_name)
  }
  if (input$title != ""){
    objects$static_plot <- objects$static_plot + ggtitle(input$title)
  }
}