# Load dataset
data(iris)
# Select numeric columns
iris_num <- iris[, 1:4]
# Compute correlation matrix
corr_matrix <- cor(iris_num)
print(corr_matrix)
# HEATMAP (Base R)
heatmap( corr_matrix, col = colorRampPalette(c("blue", "white", "red"))(100), main = "Correlation Heatmap of Iris Dataset"
)
# Heatmap without clustering
heatmap(
  corr_matrix, col = colorRampPalette(c("blue", "white", "red"))(100), Rowv = NA, Colv = NA, scale = "none", main = "Correlation Heatmap of Iris Dataset"
)
# Add correlation values on heatmap
text(
  x = col(corr_matrix), y = nrow(corr_matrix) - row(corr_matrix) + 1, labels = round(corr_matrix, 2)
)
# CORRPLOT
# Install once (comment after first use)
install.packages("corrplot")
library(corrplot)
# Basic corrplot
corrplot(corr_matrix)
# Circle style (upper triangle)
corrplot(
  corr_matrix, method = "circle", type = "upper", tl.col = "black"
)
# Numbersstyle
corrplot( corr_matrix, method = "number", type = "upper"
)
# Mixed correlogram
corrplot.mixed( corr_matrix,lower = "circle", upper = "number"
)
# ---------------- GGPLOT2 CORRELOGRAM ---------------- # install.packages("reshape2")
library(ggplot2)

corr_matrix <- cor(mtcars[, sapply(mtcars, is.numeric)])

corr_long <- as.data.frame(as.table(corr_matrix))
colnames(corr_long) <- c("Var1", "Var2", "value")

ggplot(corr_long, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal() +
  labs(title = "Correlation Heatmap of mtcars")
# Correlogram with values
ggplot(corr_long, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient2(
    low = "blue", mid = "white", high = "red", midpoint = 0
  ) +
  theme_minimal() +
  labs(title = "Correlogram with Values")
# ---------------- GGALLY ADVANCED ---------------- # install.packages("GGally")
library(GGally)
# Correlation plot with labels
ggcorr(
  iris_num, label = TRUE, label_round = 2
)
# Scatter plot matrix
ggpairs(
  iris, columns = 1:4, aes(color = Species)
)