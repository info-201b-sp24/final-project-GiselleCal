
library(shiny)
library(bslib)


#Ui 
ui <- page_sidebar(
  title = "Saturation color templet",
  sidebar = sidebar("Sidebar"),
  card(
    card_header("Saturation variation in color range"),
    "Card Body"
  )
)

server <- function(input,output) {
  
}

shinyApp(ui = ui, server = server)