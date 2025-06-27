# Box for animation options
box_animation <- function(){
  box(
    width = 12,
    title = "Choose main axes",
    collapsible = T,
    selectInput("transition", "transition", choices = list())
  )
}