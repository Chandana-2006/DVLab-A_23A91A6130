# Install Package
install.packages("leaflet")
# Load the library
library(leaflet)
# Very Basic Map
leaflet() %>% addTiles()
# Map centered on a Location
leaflet() %>%
  addTiles() %>%
  setView(
    lng = 78.9629,
    lat = 20.5937,
    zoom = 5
  )
# Add a Marker
# Example: New Delhi
leaflet() %>%
  addTiles() %>%
  addMarkers(
    lng = 77.2088,
    lat = 28.6139
  )
# Marker with Popup information
leaflet() %>%
  addTiles() %>%
  addMarkers(
    lng = 77.2088,
    lat = 28.6139,
    popup = "New Delhi"
  )
# Multiple Markers
cities <- data.frame(
  name = c("Delhi","Mumbai","Chennai","Kolkata"),
  lat = c(28.6139,18.9582,13.0827,22.5744),
  lng = c(77.2088,72.8321,80.2707,88.3629)
)
leaflet(cities) %>%
  addTiles() %>%
  addMarkers(
    lng = ~lng,
    lat = ~lat,
    popup = ~name
  )
# Circle Markers (instead of pins, use circles)
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers( l
                    ng = ~lng,
                    lat = ~lat,
                    radius = 6,
                    color = "red",
                    popup = ~name
  )
# Map with Color Palette
cities$pop <- c(30,20,11,15)
pal <-
  colorNumeric( palette
                = "Reds", domain =
                  cities$pop
  )
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers( l
                    ng = ~lng,
                    lat = ~lat,
                    radius = ~pop,
                    color = ~pal(pop),
                    popup = ~name
  )
# Add Legend
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers( l
                    ng = ~lng,
                    lat = ~lat,
                    radius = ~pop,
                    color = ~pal(pop),
                    popup = ~name
  ) %>%
  addLegend(
    position = "bottomright",
    pal = pal,
    values = ~pop,
    title = "Population"
  )
# Different map styles leaflet supports different tile layers
# Default OpenStreetMap
leaflet() %>%
  addProviderTiles("OpenStreetMap")
# Dark Theme
leaflet() %>%
  addProviderTiles("CartoDB.DarkMatter")
# Light minimal
leaflet() %>%
  addProviderTiles("CartoDB.Positron")
# Satellite imagery
leaflet() %>%
  addProviderTiles("Esri.WorldImagery")
# Advanced Map with Layers
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~lng,
    lat = ~lat,
    radius = 8,
    color = "blue",
    group = "cities"
  ) %>%
  addLayersControl( overlayGroup
                    s = c("cities"),
                    options = layersControlOptions(collapsed = TRUE)
  )