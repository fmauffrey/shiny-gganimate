# Add animation layers to the static plot using gganimate
animate_plot <- function(objects, input){
  objects$animated_plot <- objects$static_plot + 
    transition_states(.data[[input$transition]],
                      transition_length = 2,
                      state_length = 1)
}