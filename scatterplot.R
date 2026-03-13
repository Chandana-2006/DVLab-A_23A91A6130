#Load & Understand the Iris Dataset
data(iris)
str(iris)
View(iris)

#Basic Sactter Plot:Sepal Length vs Sepal Width
plot(iris$Sepal.Length,iris$Sepal.Width)

#Labeled Scatter Plot
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  main = "Sepal Length vs Sepal Width",
  xlab = "Sepal Length(cm)",
  ylab = "Sepal Width(cm)",
  col = "blue",
  pch = 16
)

#Colored Scatter Plot by Species
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16
  )
#Multivariable scatter
#Add size as a third variable
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16,
  cex = iris
)
