library(ggplot2)
library(ggplotly)
library(shiny)


foundation_dataset <- read.csv("https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-Aisha03792/main/shades.csv")


server <- function(input, output, session) {
  output$chartUSplot <- renderPlotly({
    data <- switch(input$chart_type,
                   "Fenty" = fenty_data,
                   "Mac" = mac_data,
                   "House of Tara" = House_data,
                   "Hegai and Ester" = Hegai_data)
    p2 <- ggplot(data = data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "black") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle(paste(input$chart_type, "Foundation: Saturation Level")) +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartUS.2 <- renderPlotly({
    
    p2 <- ggplot(mac_data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle("MAC Foundation: Saturation Levels") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartNig1 <- renderPlotly({
    
    p <- ggplot(House_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("House of Tara: Saturation Levels") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartNig2 <- renderPlotly({
    
    p <- ggplot(Hegai_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("Hegai and Ester: Saturation Levels") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartjapan1 <- renderPlotly({
    
    p <- ggplot(ipsa_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("House of Tara vs. Hegai and Ester: Saturation Comparison") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartjapan2 <- renderPlotly({
    
    p <- ggplot(addict_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("House of Tara vs. Hegai and Ester: Saturation Comparison") +
      theme_minimal()
    ggplotly(p2)
  })
  output$chartIndi1 <- renderPlotly({
    
    p <- ggplot(Lakmé_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("House of Tara vs. Hegai and Ester: Saturation Comparison") +
      theme_minimal()
    ggplotly(p2)
  })
  
  output$chartIndi2 <- renderPlotly({
    
    p <- ggplot(LotusHerbals_data, aes(x = product, y = S, size = S, color = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "blue") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(x = "Product", y = "Saturation", color = "Brand") +
      ggtitle("House of Tara vs. Hegai and Ester: Saturation Comparison") +
      theme_minimal()
    ggplotly(p2)
  })
  
}