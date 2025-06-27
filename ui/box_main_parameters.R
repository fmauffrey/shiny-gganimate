# Box for axes choice
box_main_parameters <- function(){
  box(
    width = 12,
    title = "Choose main axes",
    collapsible = T,
    pickerInput("plot_type",
                "Plot type",
                choices = list("Scatter plot",
                               "Histogram",
                               "Bar",
                               "Boxplot",
                               "Violin plot"
                               )),
    selectInput("plot_x", "X axis", choices=list()),
    selectInput("plot_y", "Y axis", choices=list())
  )
}