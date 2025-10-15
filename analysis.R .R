setwd("~/Documents/GitHub/assignment2-DF") 

# analysis.R
# ------------------------------
# Load penguins.csv
# Run descriptive analyses
# Save output
# ------------------------------

# Install tidyverse if needed
# install.packages("tidyverse")

library(tidyverse)

# 1. Load the dataset
penguins <- read_csv("penguins.csv")

# 2. Descriptive analysis
dim_info <- dim(penguins)               # number of rows and columns
summary_stats <- summary(penguins)      # summary statistics

species_count <- penguins %>%
  group_by(species) %>%
  summarise(count = n())

# 3. Print to console
print(dim_info)
print(summary_stats)
print(species_count)

# 4. Save outputs
capture.output(summary_stats, file = "summary_stats.txt")
write_csv(species_count, "species_count.csv")

# 5. Plot body mass by species
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Body Mass by Penguin Species")

# Save plot
ggsave("species_boxplot.png")

