
library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$chart3plot <- renderPlotly({
    data <- switch(input$chart_type,
                   fenty_data <- subset(foundation_dataset, brand == "Fenty"),
                   mac_data <- subset(foundation_dataset, brand = "MAC"))
    
    p2 <- ggplot(data = fenty_data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "green") +
      scale_size_continuous(range = c(3, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle(input$chart_type, "Foundation: Saturation Level") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chart3.2Aisha <- renderPlotly({
    
    p2 <- ggplot(data = mac_data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(3, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle("MAC Foundation: Saturation Level") +
      theme_minimal()
    ggplotly(p2)
  })
}