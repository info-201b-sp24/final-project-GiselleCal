# Load ggplot2
library(ggplot2)
library(plotly)
library(gapminder)

foundation_dataset <- read.csv("shades (1).csv")

#filtering data just to get the two brands!
 
filtered_data <- subset(foundation_dataset, brand %in% c("Fenty", "MAC"))

# Bar graph: Comparing the difference saturation levels between Fenty and Mac. 
 ggplot(data = filtered_data, aes(
  x = product, 
  y = S, 
  fill = brand)) + 
  geom_bar(stat = "identity",position = "dodge", colour = "black") + 
  labs(y = "Saturation Levels", x = "Brands", fill = "Brands") + 
  ggtitle("Fenty vs. Mac: Saturation Level Differences")
