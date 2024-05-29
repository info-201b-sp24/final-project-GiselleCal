library(shiny)
library(bslib)
library(ggplot2)

ui <- navbarPage(
  title = "Final Info project",
  sidebar = sidebar("Sidebar"),
  tabPanel("Introduction",
           mainPanel(
             h2("Main Content for Introduction"),
             p("This is the main content for the introduction page."),
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
  tabPanel("Page 3",
           mainPanel(
             h2("Main Content for Chart 3"),
             p("This is the main content for Page 3."),
             plotOutput("chart3plot")
           )
  ),
  tabPanel("Conclusion",
           mainPanel(
             h2("Main Content for Conclusion"),
             p("This is the main content for the conclusion.")
           )
  ),
)