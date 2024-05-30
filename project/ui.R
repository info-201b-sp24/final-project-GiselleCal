library(shiny)
library(ggplot2)
library(plotly)
library(shinythemes)

ui <- navbarPage(
  title = "Final Info project",
  theme = bs_theme(bg = "#A1B6B0", 
                   fg = "black",
                   primary = "#C2858C",
                   base_font = font_google("Montserrat")
  ),
  sidebar = NULL,
  tabPanel("Introduction",
           imageOutput("Info_final_image.png"),
           mainPanel(
             h2("Diversity in the Makeup Industry (How Can The Industry Improve?)"),
             img(src='Info_final_Image.png', height = 400, width = 400, align = "center"),
             p("Our project is focused on the inclusivity of foundation ranges with two brands such as Fenty Beauty and Mac. For many years, there has been ongoing demand and concerns regarding inclusivity in the beauty industry. It is common knowledge, how diversity is glaringly insufficient and undesirable in today's progressive society. The darker shades of foundation on the color spectrum are usually limited and not many people of color have access to a wider range of shades within their skin tone. Despite people of color perpetually voicing their concerns about the lack of diversity. Unfortunately, many well-known brands disregard these claims and instead, they consistently cater to a lighter range of skin tones. No matter how many times consumers raise their voices, it has become apparent that disregarding the inclusivity of a certain population is a very detrimental oversight. Considering the fact that customers can wield their purchasing power anytime for a change. After many years, now the beauty industry is slowly evolving and some changes have been pioneered with brands like Fenty Beauty. Especially brands like Fenty Beauty a Black-owned brand, is known for advocating for inclusivity and her foundation ranges are more diverse than any other brands."),
             p("The objective of this project is to conduct an analysis of the foundation shade offerings between two highly sought and leading cosmetic brands, Fenty Beauty (Black owned brand) and Mac Cosmetics (White owned brand). We are collecting and analyzing our data from, The Pudding: Beauty Brawl. We intend to evaluate the elements within foundation shade coloring that leads to a more diverse and inclusive range of foundation shades by evaluating the Saturation, Hues, and Lightness range of the brand shades."),
             h4("Original Data:"), 
             p("https://raw.githubusercontent.com/the-pudding/data/master/makeup-shades/shades.csv"),
             h3("Questions:"),
             p("Some research questions that we want to address in our project are what ranges of foundation shades are offered compared to different brands? Also how diverse are the lightness, saturation, and hues of each of the undertones? How does each brand show inclusivity within its foundation ranges?"),
             p("These questions are important to address because we want to investigate how prominent it is to have inclusivity when it comes to the beauty industry. Moreover, we want the beauty industry to cater to all skin tones and not be biased when it comes to representing people of color."),
             h3("Ethical Questions:"),
             p("A question of power we need to take into consideration is the power imbalance between BIPOC owned brands and Non-BIPOC owned brands. Many non-BIPOC owned brands such as MAC have the brand exposure in comparison to others. In our case Fenty, a cosmetic brand owned by Rhianna receives publicity exposure; however, due to Rhianna’s popularity her makeup brand receives plenty of publicity, but the inequity overall between brand exposure still applies."),
             h3("Limitations:"),
             p("The challenges or limitations that may arise while working with our dataset are heavily dependent on the size of the dataset, and how they have decided to evaluate the foundation shades. While the data set provides us with a good starting point it still leaves us with limitations and challenges regarding the foundation colors and companies that they have analyzed. Another challenge that arises with our dataset is that there is a lack of visual representation of the shade colors they evaluated This makes it less accessible, as hue and saturation are not common knowledge when customers are shopping for foundation shades. The insufficiency of a visual presence for the foundation colors can hinder the understanding of the diversity and inclusivity of these brands’ shade ranges. This would also pose a challenge in assessing the diversity and inclusivity of the brand's foundation shades when we are not able to analyze further and identify if undertone and skin tones play a role in the shade ranges they have included in their dataset."),
           )
  ),
 tabPanel("Histogram",
           fluidPage(
             titlePanel("Interactive Histogram of Foundation Shades"),
             
             sidebarLayout(
               sidebarPanel(
                 p("You can play with the foundation brands of different companies to see their lightness range of one another. Also, you can try to compare and contrast each brand of foundation to make an observation of what kind of audiences these companies cater to the most? Further, this Dataset includes White owned brands, Black owned brands and International owned brands from India, Japan, and Nigeria")                 sliderInput("bins", "Number of Bins:", min = 10, max = 50, value = 30),
                 checkboxGroupInput("brands", "Select Brands:",
                                    choices = unique(foundation_dataset$brand),
                                    selected = c("Fenty", "MAC"))
               ),
               
               mainPanel(
                 plotlyOutput("histogramPlot"),
                 p("The above data set shows the main two brand comparison of lightness shades of the two brands Fenty and Mac. Observing the data set you can see how Fenty Foundation has more darker shades than the brand Mac. On the other hand, Mac has more frequency of lightness foundation than Fenty. For example, in the dataset, Mac has more significant brands of foundation that appear to be lighter and one shade that is the darkest. Additionally, in this dataset, the brand Mac appears to cater to more lighter skin color people instead of having an equal distribution of shades of all people of color like Fenty. If you just select the brand Fenty in the dataset, you can see how diverse Rihanna a black owned celebrity foundation appears to be. Since Rihanna is Black, she understands how important inclusivity is for all people. Unlike Mac a White owned company who invairably profits more from making lighter foundtion and barely even focusing on the struggle of people of color")
               )
             )
           )
  ),
  
tabPanel("Page 2",
           mainPanel(
             h2("Main Content for Chart 2"),
             p("This is the main content for Page 2.")
           )
  ),
tabPanel("Saturation Exploration",
         fluidPage(
           titlePanel("Saturations effect on color!"),
           sidebarLayout(
             sidebarPanel(
               p("This section allows you to play and explore the difference in saturation between beauty companies from different regions to show the differences of saturation these companies have. This section puts the data I have collected between Mac and Fenty within a bubble graph. This section attempts to answer the question: How diverse is saturation and how does that play in the undertones of makeup companies?")
             ),
             mainPanel(
               selectInput("my_select_input",
                           label = "Select a region to explore:",
                           choices = c("Choose region","Nigerian Brands", "Indian Brands", "Japan Brands", "American Brands"),
                           selected = "Choose Region"),
               radioButtons("chart_type",
                            "Select Chart to display:", 
                            choices = c("Fenty", "Mac", "House of Tara", 
                                        "Hegai and Ester", "Addiction", "IPSA", "Lakmé", "Lotus Herbals"),
                            selected = "Fenty"),
               plotlyOutput("chartUSplot"),
               plotlyOutput("chartUS.2"),
               plotlyOutput("chartNig1"),
               plotlyOutput("chartNig2"), 
               plotlyOutput("chartjapan1"),
               plotlyOutput("chartjapan2"),
               plotlyOutput("chartIndi1"),
               plotlyOutput("chartIndi2")
             )
           )
         )
),

  tabPanel("Conclusion",
           mainPanel(
             h2("Main Content for Conclusion"),
             p("This is the main content for the conclusion.")
           )
  ),
)
server <- function(input, output, session) {
  output$chartUSplot <- renderPlotly({
    data <- switch(input$chart_type,
                   "Fenty" = fenty_data,
                   "Mac" = mac_data,
                   "House of Tara" = House_data,
                   "Hegai and Ester" = Hegai_data,
                   "Addiction" = addict_data,
                   "IPSA" = ipsa_data, 
                   "Lakmé" = Lakmé_data, 
                   "Lotus Herbals" = LotusHerbals_data,
    )
    
    p2 <- ggplot(data = data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "black") +
      scale_size_continuous(range = c(-5, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle(paste(input$chart_type, "Foundation: Saturation Level")) +
      theme_minimal()
    ggplotly(p2)
    
  })
}

server <- function(input, output) {
  filtered_data <- reactive({
    subset(foundation_dataset, brand %in% input$brands)
  })
  
  output$histogramPlot <- renderPlotly({
    p <- ggplot(data = filtered_data(), aes(x = L, fill = brand, text = paste("Brand:", brand, "<br>Lightness:", L))) +
      geom_histogram(bins = input$bins, color = "black", alpha = 0.7, position = "identity") +
      labs(
        title = "Histogram of Lightness for Selected Brands",
        x = "Lightness",
        y = "Frequency",
        fill = "Brand"
      ) +
      theme_minimal()
    
    ggplotly(p, tooltip = "text")
  })
}


shinyApp(ui = ui, server = server)


