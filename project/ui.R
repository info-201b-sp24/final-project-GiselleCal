library(shiny)
library(ggplot2)
library(plotly)
library(shinythemes)

ui <- navbarPage(
  theme = bs_theme(bg = "#A1B6B0",
                   fg = "black",
                   primary = "maroon",
                   base_font = font_google("Montserrat")
  ),
  title = "Final Info project",
  sidebar = NULL,
  tabPanel("Introduction",
           imageOutput("Info_final_image.png"),
           mainPanel(
             h2("Diversity in the Makeup Industry (How Can The Industry Improve?)"),
             img(src='Info_final_Image.png', height = 400, width = 400, align = "center"),
             p("Our project is focused on the inclusivity of foundation ranges with two brands such as Fenty Beauty and Mac. For many years, there has been ongoing demand and concerns regarding inclusivity in the beauty industry. It is common knowledge, how diversity is glaringly insufficient and undesirable in today's progressive society. The darker shades of foundation on the color spectrum are usually limited and not many people of color have access to a wider range of shades within their skin tone. Despite people of color perpetually voicing their concerns about the lack of diversity. Unfortunately, many well-known brands disregard these claims and instead, they consistently cater to a lighter range of skin tones. No matter how many times consumers raise their voices, it has become apparent that disregarding the inclusivity of a certain population is a very detrimental oversight. Considering the fact that customers can wield their purchasing power anytime for a change. After many years, now the beauty industry is slowly evolving and some changes have been pioneered with brands like Fenty Beauty. Especially brands like Fenty Beauty a Black-owned brand, is known for advocating for inclusivity and her foundation ranges are more diverse than any other brands."),
             p("The objective of this project is to conduct an analysis of the foundation shade offerings between two highly sought and leading cosmetic brands, Fenty Beauty (Black owned brand) and Mac Cosmetics (White owned brand). We are collecting and analyzing our data from, *The Pudding: Beauty Brawl*. We intend to evaluate the elements within foundation shade coloring that leads to a more diverse and inclusive range of foundation shades by evaluating the Saturation, Hues, and Lightness range of the brand shades."),
             p("Original Data: https://raw.githubusercontent.com/the-pudding/data/master/makeup-shades/shades.csv"),
             h3("Questions:"),
             p("Some research questions that we want to address in our project are what ranges of foundation shades are offered compared to different brands? Also how diverse are the lightness, saturation, and hues of each of the undertones? How does each brand show inclusivity within its foundation ranges?"),
             p("These questions are important to address because we want to investigate how prominent it is to have inclusivity when it comes to the beauty industry. Moreover, we want the beauty industry to cater to all skin tones and not be biased when it comes to representing people of color."),
             h3("Ethical Questions:"),
             p("A question of power we need to take into consideration is the power imbalance between BIPOC owned brands and Non-BIPOC owned brands. Many non-BIPOC owned brands such as MAC have the brand exposure in comparison to others. In our case Fenty, a cosmetic brand owned by Rhianna receives publicity exposure; however, due to Rhianna’s popularity her makeup brand receives plenty of publicity, but the inequity overall between brand exposure still applies."),
             h3("Limitations:"),
             p("The challenges or limitations that may arise while working with our dataset are heavily dependent on the size of the dataset, and how they have decided to evaluate the foundation shades. While the data set provides us with a good starting point it still leaves us with limitations and challenges regarding the foundation colors and companies that they have analyzed. Another challenge that arises with our dataset is that there is a lack of visual representation of the shade colors they evaluated This makes it less accessible, as hue and saturation are not common knowledge when customers are shopping for foundation shades. The insufficiency of a visual presence for the foundation colors can hinder the understanding of the diversity and inclusivity of these brands’ shade ranges. This would also pose a challenge in assessing the diversity and inclusivity of the brand's foundation shades when we are not able to analyze further and identify if undertone and skin tones play a role in the shade ranges they have included in their dataset."),
           )
  ),
  tabPanel("Page 1",
           mainPanel(
             h2("Main Content for Chart 1"),
             p("This is the main content for Page 1."),
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
                 p("In this page we are going to futhure out reserch of how saturation playes a role when making shade ranges in these companies.")
               ),
               mainPanel(
                 radioButtons("chart_type",
                              "Select Chart to display:", 
                              choices = c("Fenty" = "Fenty", "Mac" = "Mac"), 
                              selected = "Fenty"),
                 plotlyOutput("chart3plot"),
                 plotlyOutput("chart3.2Aisha")
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
  output$chart3plot <- renderPlotly({
    data <- switch(input$chart_type,
                   "Fenty" = fenty_data,
                   "Mac" = mac_data)
    p2 <- ggplot(data = data, aes(x = product, y = S, size = S, fill = brand)) + 
      geom_point(position = position_jitter(width = 0.3, height = 0.3), alpha = 0.7, shape = 21, colour = "black") +
      scale_size_continuous(range = c(3, 10)) +
      labs(y = "Saturation Levels", x = "Product", fill = "Brand", size = "Saturation") +
      ggtitle(paste(input$chart_type, "Foundation: Saturation Level")) +
      theme_minimal()
    ggplotly(p2)
  })
}

shinyApp(ui = ui, server = server)


