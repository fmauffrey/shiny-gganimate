# Box for axes choice
box_colors_settings <- function(){
  box(
    width = 12,
    title = "Colors settings",
    collapsible = T,
    collapsed = T,
    selectInput("plot_colors_settings", "Colors settings", choices=list())
  )
}