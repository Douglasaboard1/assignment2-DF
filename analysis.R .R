setwd("~/Documents/GitHub/assignment2-DF") 



library(tidyverse)


penguins <- read_csv("penguins.csv")

#. Descriptive analysis
dim_info <- dim(penguins)               # number of rows and columns
summary_stats <- summary(penguins)      # summary statistics

species_count <- penguins %>%
  group_by(species) %>%
  summarise(count = n())

# Print to console
print(dim_info)
print(summary_stats)
print(species_count)

# Save outputs
capture.output(summary_stats, file = "summary_stats.txt")
write_csv(species_count, "species_count.csv")

#  Plot body mass by species
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Body Mass by Penguin Species")

# Save plot
ggsave("species_boxplot.png")

# Added regression analysis for pull request
lm_result <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
capture.output(summary(lm_result), file = "regression_output.txt")

