# Load the Dataset
data(iris)

# Inspect the Data
?iris
head(iris, 3)
str(iris)
class(iris)

# View Species column
iris$Species
View(iris)

# Very Basic Bar Chart
barplot(
  table(iris$Species)
)

# Labeled Bar Chart
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Items",
  col = "steelblue"
)

# Bar Chart from Aggregated Data
# Mean Sepal Length per Species
mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)
mean_sepal

barplot(
  mean_sepal,
  col = "orange",
  main = "Average Sepal Length by Species",
  xlab = "Species",
  ylab = "Mean Sepal Length"
)

# Grouped Bar Chart
# Mean Sepal & Petal Length
group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species, mean),
  Petal = tapply(iris$Petal.Length, iris$Species, mean)
)
group_means

# Grouped (Clustered) Bar Chart
barplot(
  group_means,
  beside = TRUE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Clustered Bar Chart: Sepal vs Petal Length"
)

# Grouped (Stacked) Bar Chart
barplot(
  group_means,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Length"
)

