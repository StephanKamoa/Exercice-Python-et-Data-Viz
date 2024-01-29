library(ggplot2)



file_name = ('D:/Steph/IAD/R/kc_house_data_NaN.csv')
df = read.csv(file_name)
head(df)

# Question 1 :
str(df)

summary(df)

# Data Wrangling
# Question 2 :

df <- df[, !(colnames(df) %in% c("id", "X"))]
summary(df)

# Missing values for the column Bedrooms and bathrooms :*

# bedrooms :
cat("valeurs manquantes dans bedrooms :", sum(is.na(df$bedrooms)), "\n")

# bathrooms :
cat("valeurs manquantes dans bathrooms :", sum(is.na(df$bathrooms)), "\n")

#########
moyenne_bedrooms <- mean(df$bedrooms, na.rm = TRUE)
df$bedrooms[is.na(df$bedrooms)] <- moyenne_bedrooms
#########
moyenne_bathrooms <- mean(df$bathrooms, na.rm = TRUE)
df$bathrooms[is.na(df$bathrooms)] <- moyenne_bathrooms

cat("valeurs manquantes dans bedrooms :", sum(is.na(df$bedrooms)), "\n")
cat("valeurs manquantes dans bathrooms :", sum(is.na(df$bathrooms)), "\n")

# Module 3 : Exploratory Data Analysis
# Question 3 :
etages_counts <- as.data.frame(table(df$floors))
print(etages_counts)

# Question 4:

ggplot(df, aes(x = as.factor(waterfront), y = price)) +
  geom_boxplot() +
  labs(title = "Boxplot 'Waterfront' et 'Price'")

# Question 5:
ggplot(df, aes(x = sqft_above, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "blue") +
  labs(title = " positively correlated or not.")



colonne_numerique <- sapply(df, is.numeric)
tableau_numerique <- df[, colonne_numerique]
correlation_matrix <- cor(tableau_numerique)
correlation_avec_prix <- correlation_matrix[,"price"]
correlation_trie <- sort(correlation_avec_prix)
print(correlation_trie)

# Module 4 : Model Development
linear_model <- lm(price ~ long, data = df)
summary(linear_model)








