library(ggplot2)

URL = "C:/Users/KAMOA/Downloads/Compressed/diamonds.csv"
diamonds = read.csv(URL)
head(diamonds, 5)

str(diamonds)

# Diagramme de disperssion du prix vis-à-vis du carat:
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  labs(x = "carat", y = "price") +
  theme_minimal()

# Utilisation des paramètres alpha et edgecolor :

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.1, color = "blue", shape = 10) +
  labs(x = "carat", y = "price") +
  theme_minimal()

# Agrandissement du graphique précédent :
options(repr.plot.width=10, repr.plot.height=8)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.1, color = "blue", shape = 10) +
  labs(x = "carat", y = "price") +
  theme_minimal()

# Histogramme des prix :

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "skyblue") +
  labs(x = "price") +
  theme_minimal()

# Graphique de comptage des instances 

ggplot(diamonds, aes(x = cut)) +
  geom_bar(fill = "skyblue") +
  labs(x = "cut", y = "count") +
  theme_minimal()

# Diagramme en boîte :

options(repr.plot.width=10, repr.plot.height=8)
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(x = "cut", y = "price") +
  theme_minimal()

# Défi :

options(repr.plot.width=10, repr.plot.height=8)
order = c('Fair', 'Ideal', 'Good', 'Very Good', 'Premium')

# en suivant l'ordre :
diamonds$cut = factor(diamonds$cut, levels = order)
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(x = "cut", y = "price") +
  theme_minimal()
