library(ggplot2)
library(plotly)
library(gapminder)

foundation_dataset <- read.csv("https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-Aisha03792/main/shades.csv")

#filtering data just to get the two brands!

filtered_data <- subset(foundation_dataset, brand %in% c("Fenty", "MAC"))

fenty_data <- subset(foundation_dataset, brand %in% c("Fenty"))
mac_data <- subset(foundation_dataset, brand %in% c("MAC"))

addict_data <- subset(foundation_dataset, brand %in% c("Addiction"))
House_data <- subset(foundation_dataset, brand %in% c("House of Tara"))

Hegai_data <- subset(foundation_dataset, brand %in% c("Hegai and Ester"))
ipsa_data <- subset(foundation_dataset, brand %in% c("IPSA"))

Lakmé_data <- subset(foundation_dataset, brand %in% c("Lakmé"))
LotusHerbals_data <- subset(foundation_dataset, brand %in% c("Lotus Herbals"))



# Bar graph: Comparing the difference saturation levels between Fenty and Mac. 

p <- gapminder %>%
  ggplot(data = filtered_data, aes(
    x = product, 
    y = S, 
    fill = brand)) + 
  geom_bar(stat = "identity",position = "dodge", colour = "black") + 
  labs(y = "Saturation Levels", x = "Brands", fill = "Brands") + 
  ggtitle("Fenty vs. Mac: Saturation Level Differences")
ggplotly(p)
