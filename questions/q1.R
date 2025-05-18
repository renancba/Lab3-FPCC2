library(dplyr)
library(ggplot2)
library(lubridate)
library(kableExtra)
library(readr)

# Carregar os dados
dados <- read_csv("data/participation-per-country.csv")

ggplot(dados, aes(x = PDI, y = comentaram_prop)) +
  geom_point(aes(size = usuarios, color = Internet), alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
  scale_color_gradient(low = "lightblue", high = "darkblue") +
  scale_size(range = c(2, 10)) +
  labs(
    title = "Comentaram_prop vs PDI com Acesso à Internet",
    subtitle = "Cor = Acesso à Internet (gradiente) | Tamanho = Usuários | Continente não representado por cor",
    x = "Distância ao Poder (PDI)",
    y = "Proporção que comentou (comentaram_prop)",
    color = "Internet (%)",
    size = "Usuários"
  ) +
  theme_minimal()
