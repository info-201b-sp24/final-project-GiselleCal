#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    output$chart3plot <- renderPlot({
      p2 <- ggplot(data = filtered_data, aes(
        x = product, 
        y = S, 
        fill = brand)) + 
        geom_bar(stat = "identity",position = "dodge", colour = "black") + 
        labs(y = "Saturation Levels", x = "Brands", fill = "Brands") + 
        ggtitle("Fenty vs. Mac: Saturation Level Differences")
      ggplotly(p2)

    })
}

shinyApp(ui = ui, server = server)