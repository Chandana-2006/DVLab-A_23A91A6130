# Load Air Passengers Data Set
data("AirPassengers")
?AirPassengers  # For help/documentation
class(AirPassengers)
View(AirPassengers)

# Create a data frame with Years and Months separately
ap_df <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)

# View the new data frame
head(ap_df)

# Basic plot
plot(AirPassengers)

# Plot with Title, Axis labels, and color
plot(AirPassengers,
     type = 'l',
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No of Passengers",
     col = "red"
)

# Changing the line Width & adding points
plot(AirPassengers,
     type = 'l',
     lwd = 1.5,
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No of Passengers",
     col = "red"
)
points(AirPassengers,
       type = 'o',
       pch = 16,
       col = "blue")
grid()

# Using GGplot2 Library
# Installing if not already installed
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# A basic grid with x & y axes using ggplot2
ggplot(ap_df, aes(x = year + (month-1)/12, y = passengers)) +
  geom_line(color = "darkgreen", linewidth = 0.5) +
  geom_point(color = "red", size = 0.5) +
  geom_smooth(se = FALSE, color = "orange") +
  labs(
    title = 'Trend Analysis of Air Passengers',
    subtitle = 'From 1949-1960',
    caption = 'Using Built-in Air Passengers Dataset',
    x = 'Year',
    y = 'No of Passengers'
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 10)
  )

