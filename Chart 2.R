library(ggplot2)

foundation_dataset <- read.csv("shades.csv")

filtered_values <- subset(foundation_dataset, brand %in% c("MAC", "Fenty"))

# Box plot to compare ratings for MAC and Fenty shades
ggplot(filtered_values, aes(x=brand, y=H, fill=brand)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title="Box Plot of Ratings for MAC and Fenty Shades", x="Brand", y="Hue")




