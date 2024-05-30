library(tidyverse)
library(dplyr)
library(knitr)

original_data <- read.csv("shades.csv")

all_brands <- select(original_data, c(brand, product, hex, H, S, L))

fenty_table <- filter(all_brands, brand == c("Fenty"))
fenty_table <- arrange(fenty_table, L)

mac_table <- filter(all_brands, brand == c("MAC"))
mac_table <- arrange(mac_table, L)

fenty_x_mac_table <- full_join(fenty_table, mac_table)

fenty_x_mac_table <- rename(fenty_x_mac_table, Brand = brand)
fenty_x_mac_table <- rename(fenty_x_mac_table, Product = product)
fenty_x_mac_table <- rename(fenty_x_mac_table, Shade_Code = hex)
fenty_x_mac_table <- rename(fenty_x_mac_table, Hue = H)
fenty_x_mac_table <- rename(fenty_x_mac_table, Saturation = S)
fenty_x_mac_table <- rename(fenty_x_mac_table, Lightness = L)
mac_x_fenty_table <- data.frame(fenty_x_mac_table)
kable(mac_x_fenty_table)
group_by(fenty_x_mac_table, Hue)