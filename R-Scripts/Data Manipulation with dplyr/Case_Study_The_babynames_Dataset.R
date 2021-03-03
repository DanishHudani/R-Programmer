library(dplyr)
library(ggplot2)

babynames = readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/babynames.rds")

glimpse(counties)


# Filter for the year 1990
babynames %>% filter(year == 1990)


# Sort the number column in descending order 
babynames %>% filter(year == 1990) %>%
  arrange(desc(number))
# The most common names for babies born in the US in 1990 were Michael, Christopher, and Jessica.

# Find the most common name in each year
babynames %>% group_by(year) %>%
  top_n(1, number)
# It looks like John was the most common name in 1880, and Mary was the most common name for a while after that.


# Filter for the names Steven, Thomas, and Matthew 
selected_names <- babynames %>%
  filter(name %in% c("Steven", "Thomas", "Matthew"))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = number, color = name)) +
  geom_line()
# It looks like names like Steven and Thomas were common in the 1950s, but Matthew became common more recently.

# Calculate the fraction of people born each year with the same name
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(number)) %>%
  ungroup() %>%
  mutate(fraction = number / year_total) %>%
  # Find the year each name is most common
  group_by(name) %>%
  top_n(1, fraction)

names_normalized <- babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  # Ungroup the table 
  ungroup() %>%
  # Add the fraction_max column containing the number by the name maximum 
  mutate(fraction_max = number / name_max)

# Filter for the names Steven, Thomas, and Matthew
names_filtered <- names_normalized %>% filter(name %in% c("Steven", "Thomas", "Matthew"))


# Visualize these names over time
ggplot(names_filtered, aes(x = year, y = fraction_max, color = name)) + geom_line()

babynames_fraction <- babynames %>% 
  group_by(year) %>% 
  mutate(year_total = sum(number)) %>%
  ungroup() %>%
  mutate(fraction = number / year_total)

babynames_fraction %>%
  # Arrange the data in order of name, then year 
  arrange(name, year) %>%
  # Group the data by name
  group_by(name) %>%
  # Add a ratio column that contains the ratio between each year 
  mutate(ratio = fraction / lag(fraction))

babynames_ratios_filtered <- babynames_fraction %>%
  arrange(name, year) %>%
  group_by(name) %>%
  mutate(ratio = fraction / lag(fraction)) %>%
  filter(fraction >= 0.00001)


babynames_ratios_filtered %>% top_n(1, ratio) %>%
  arrange(desc(ratio)) %>%
  filter(fraction >= 0.001)





























