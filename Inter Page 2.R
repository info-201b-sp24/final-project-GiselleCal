library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(gapminder)

# Load the dataset
foundation_dataset <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/makeup-shades/shades.csv")

# UI
ui <- fluidPage(
  titlePanel("Interactive Box Plot of Foundation Shades"),
  mainPanel(
    plotlyOutput("BoxPlot"),
    p("I used a box plot to compare the hues of foundations from Fenty and Mac. From this plot, it is evident that Fenty is more inclusive of medium and darker skin tones. The range is greater for Fenty foundations hues as well. The wider hue range implies that there’s inclusivity and broader skin tones are accommodated. A variety of skin tones can be matched with a wider hue range. Hence Fenty, having a wider hue range, is able to have foundation shades that match more skin tones.")
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Filtered dataset for MAC and Fenty
  filtered_values <- subset(foundation_dataset, brand %in% c("MAC", "Fenty"))
  
  # Create the box plot
  output$BoxPlot <- renderPlotly({
    p2 <- ggplot(filtered_values, aes(x=brand, y=H, fill=brand)) +
      geom_boxplot() +
      theme_minimal() +
      labs(title="Box Plot of Ratings for MAC and Fenty Shades", x="Brand", y="Hue")
    ggplotly(p2)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
