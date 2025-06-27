# Box for plot title, axes names and annotations
box_annotations <- function(){
  box(
    width = 12,
    title = "Title, axes names and note",
    collapsible = T,
    collapsed = T,
    textInput("title", "Title", value = ""),
    textInput("x_axis_name", "X axis name", value = ""),
    textInput("y_axis_name", "Y axis name", value = "")
  )
}