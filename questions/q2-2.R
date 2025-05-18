library(plotly)
library(dplyr)
library(ggplot2)
library(readr)
library(patchwork)

# Carregar os dados
dados <- read_csv("data/participation-per-country.csv")

plot_ly(
  data = dados,
  x = ~PDI, y = ~comentaram_prop, z = ~Internet,
  type = "scatter3d",
  mode = "markers",
  size = ~usuarios,
  marker = list(color = ~Internet, colorscale = 'Blues', showscale = TRUE)
) %>%
  layout(title = "5. Gráfico 3D (menos eficaz)")
