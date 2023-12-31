# Assuming your data frame is named joined_full_data_set
# and it has columns like ref_area, time, and Union Density

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Unique countries in the dataset
country_focus <- unique(joined_full_data_set$ref_area)

# Loop over each country and create a plot
plots <- list()
for(country in country_focus){
  # Filter data for the current country
  TUD_country <- joined_full_data_set %>%
    filter(ref_area == country)
  
  # Plotting the trend of Union Density over time
  p <- ggplot(TUD_country, aes(x = time, y = `Union Density`)) +
    geom_line() +
    labs(title = paste("Time Series of Union Density in", country),
         x = "Time",
         y = "Union Density") +
    theme_minimal()
  
  # Store the plot in the list with the country's name as the key
  plots[[country]] <- p
}

# Display all the plots
for(country in names(plots)){
  print(plots[[country]])
}
