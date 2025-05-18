library(dplyr)
library(ggplot2)
library(lubridate)
library(kableExtra)
library(readr)
library(patchwork)

# Carregar os dados
dados <- read_csv("data/participation-per-country.csv")

# Gráfico 1 - Inversão dos eixos
g1 <- ggplot(dados, aes(x = comentaram_prop, y = PDI)) +
  geom_point(aes(size = usuarios, color = Internet), alpha = 0.7) +
  scale_color_gradient(low = "lightblue", high = "darkblue") +
  theme_minimal() +
  labs(title = "1. Eixos invertidos")

# Gráfico 2 - Sem cor, sem facetas, sem tamanho
g2 <- ggplot(dados, aes(x = PDI, y = comentaram_prop)) +
  geom_point(size = 3, alpha = 0.7) +
  theme_minimal() +
  labs(title = "2. Sem cor, tamanho ou facetas")

# Gráfico 3 - Só cor (Internet), sem tamanho
g3 <- ggplot(dados, aes(x = PDI, y = comentaram_prop, color = Internet)) +
  geom_point(alpha = 0.7) +
  scale_color_gradient(low = "lightblue", high = "darkblue") +
  theme_minimal() +
  labs(title = "3. Só cor, sem tamanho")

# Gráfico 4 - Cor por continente, sem Internet
g4 <- ggplot(dados, aes(x = PDI, y = comentaram_prop, color = six_regions)) +
  geom_point(aes(size = usuarios), alpha = 0.7) +
  theme_minimal() +
  labs(title = "4. Cores categóricas por continente")

# Gráfico 5 - 3D (em plotly)
# Este será interativo separado, mas podemos mencionar ou salvar à parte

# Combine todos os gráficos (exceto o 3D)
painel <- (g1 | g2) / (g3 | g4)

# Exibir no R
print(painel)

# Exportar
ggsave("graficos_menos_eficazes.png", painel, width = 16, height = 10, dpi = 300)
